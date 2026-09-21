param(
 [Parameter(Mandatory=$true)][string]$Root,
 [string]$Shared='C:/Users/nelim/Documents/rimworld/scripts',
 [string]$Types='C:/Users/nelim/Documents/rimworld/rw16_types.txt',
 [string]$Musical='C:/Program Files (x86)/Steam/steamapps/workshop/content/294100/2274558815/1.6',
 [string]$Furniture='C:/Users/nelim/Documents/rimworld/RepossessedFurniture/Mod'
)
$ErrorActionPreference='Stop';$Root=(Resolve-Path $Root).Path
$mod=Join-Path $Root 'Mod';$results=Join-Path $Root 'Tests/Audit-2026-09-21/Results'
[IO.Directory]::CreateDirectory($results)|Out-Null
$ownAssembly=Join-Path $mod 'Assemblies/JoyPreservation.dll'
if(Test-Path (Join-Path $Root 'Source/Build.ps1')){& (Join-Path $Root 'Source/Build.ps1');& (Join-Path $Root 'Tests/Test-Chinese.ps1')}
$env:DOTNET_ROLL_FORWARD='Major'
$musicalTypes=& ilspycmd -l c (Join-Path $Musical 'Assemblies/MusicalInstruments.dll')
if($LASTEXITCODE -ne 0){throw 'Provider type inventory failed'}
$typeFile=Join-Path $results 'musical-types.txt';$musicalTypes -replace '^Class ',''|Set-Content $typeFile
foreach($name in 'XmlFields','ConfigErrors','TypeRefs','DefInjected','XmlClasses','DefRefs'){
 $arguments=@{ModPath=$mod}
 if($name -eq 'XmlFields'){$assemblies=@();if(Test-Path $ownAssembly){$assemblies+=$ownAssembly};if((Get-Content (Join-Path $mod 'About/About.xml') -Raw) -match 'Mlie.MusicalInstruments'){$assemblies+=(Join-Path $Musical 'Assemblies/MusicalInstruments.dll')};if($assemblies.Count){$arguments.ExtraAssemblies=$assemblies}}
 if($name -eq 'DefInjected'){$arguments=@{TransMod=$mod;Targets=@($mod,$Musical,$Furniture)}}
 if($name -eq 'XmlClasses'){$arguments.TypeLists=@($Types,$typeFile);if(Test-Path (Join-Path $Root 'Source')){$arguments.SourceDirs=@((Join-Path $Root 'Source'))}}
 if($name -eq 'DefRefs'){$arguments.AlsoScan=@((Join-Path $Furniture 'Defs'),$Musical)}
 $output=& (Join-Path $Shared "Check-$name.ps1") @arguments *>&1|Out-String -Width 240
 $output|Set-Content (Join-Path $results "$name.txt")
 $clean=switch($name){
  'XmlFields' {$output -match 'No unknown fields'}
  'ConfigErrors' {$output -match 'no config error'}
  'TypeRefs' {$output -match 'No unguarded reference'}
  'DefInjected' {$output -match 'errors: 0' -and $output -notmatch 'UNVERIFIED'}
  'XmlClasses' {$output -match 'tous les types references sont resolus'}
  'DefRefs' {$output -match 'aucune reference de def introuvable' -and $output -match 'tous les ParentName sont resolus' -and $output -notmatch 'MAUVAIS TYPE'}
 }
 if(-not $clean){throw "Check-$name findings: $results/$name.txt"}
 Write-Output "PASS: $(Split-Path $Root -Leaf) / $name"
}
$maps=@{}
foreach($language in 'English','French'){$map=@{};$dir=Join-Path $mod "Languages/$language/DefInjected";if(Test-Path $dir){foreach($file in Get-ChildItem $dir -Recurse -Filter *.xml){[xml]$doc=Get-Content $file.FullName -Raw;foreach($e in $doc.DocumentElement.ChildNodes){if($e.NodeType -ne 'Element'){continue};$key=$file.Directory.Name+'/'+$e.Name;if($map.ContainsKey($key) -or [string]::IsNullOrWhiteSpace($e.InnerText)){throw "Empty/duplicate $language $key"};$map[$key]=$e.InnerText}}};$maps[$language]=$map}
$inventory=@();$dirs=@('Defs','Patches'|ForEach-Object {Join-Path $mod $_}|Where-Object {Test-Path $_})
foreach($file in Get-ChildItem $dirs -Recurse -Filter *.xml){[xml]$doc=Get-Content $file.FullName -Raw;foreach($d in $doc.SelectNodes('//*[defName]')){foreach($f in $d.SelectNodes('.//label | .//description | .//reportString')){
 $parts=@();$n=$f;while($n -ne $d){$part=if($n.Name -eq 'li'){[array]::IndexOf(@($n.ParentNode.SelectNodes('li')),$n)}else{$n.Name};$parts=@($part)+$parts;$n=$n.ParentNode}
 $key=$d.Name+'/'+$d.defName+'.'+($parts -join '.');$en=if($maps.English.ContainsKey($key)){$maps.English[$key]}else{$f.InnerText}
 if([string]::IsNullOrWhiteSpace($en) -or $en -match '[\p{IsCJKUnifiedIdeographs}]' -or -not $maps.French.ContainsKey($key)){throw "Uncovered text $key"}
 $fr=$maps.French[$key];$enParams=@([regex]::Matches($en,'\{[^{}]+\}|</?[^>]+>')|ForEach-Object Value);$frParams=@([regex]::Matches($fr,'\{[^{}]+\}|</?[^>]+>')|ForEach-Object Value)
 if(($enParams -join '|') -cne ($frParams -join '|')){throw "Parameter mismatch $key"}
 $inventory+=@{Key=$key;English=$en;French=$fr}
}}}
$inventory|ConvertTo-Json -Depth 4|Set-Content (Join-Path $results 'text-inventory.json')
$summary="PASS: six shared diagnostics; $($inventory.Count) owned text fields covered EN/FR, duplicate/empty entries and parameter parity checked; no game session executed."
$summary|Set-Content (Join-Path $results 'SUMMARY.txt');Write-Output $summary


