<#
.SYNOPSIS
  Offline test of the three instrument defs AS THE GAME SEES THEM: after the patch guard
  has been evaluated and after ParentName inheritance has been applied.

.DESCRIPTION
  Check-ConfigErrors.ps1 reads defs as written and this package ships no Defs folder, so it
  reads 0 of 0 defs. The three ThingDefs only exist once Patches/EponaInstruments.xml runs
  against Musical Instruments (Continued). This script replays exactly that and asserts on
  the merged result. It never starts RimWorld.

  Inheritance follows Verse.XmlInheritance.RecursiveNodeCopyOverwriteElements (read from
  Assembly-CSharp.dll): scalar nodes of the child overwrite, nested nodes merge, `li` items
  of the child are APPENDED to the parent's list unless the list has Inherit="False".

  Exit code 0: every assertion passed. 1: at least one failed.
#>
param(
  [string]$Root = (Split-Path $PSScriptRoot -Parent),
  [string]$Provider = 'C:/Program Files (x86)/Steam/steamapps/workshop/content/294100/2274558815/1.6',
  [string]$Data = 'C:/Program Files (x86)/Steam/steamapps/common/RimWorld/Data',
  [string]$OutFile
)
$ErrorActionPreference = 'Stop'
$script:fail = 0
$script:lines = @()
function Say([string]$m) { $script:lines += $m; Write-Output $m }
function Check([bool]$ok, [string]$msg) {
  if ($ok) { Say "PASS  $msg" } else { $script:fail++; Say "FAIL  $msg" }
}

function Read-Defs([string]$dir) {
  foreach ($f in Get-ChildItem $dir -Recurse -Filter *.xml) {
    try { $d = New-Object System.Xml.XmlDocument; $d.Load($f.FullName) } catch { continue }
    if ($d.DocumentElement -and $d.DocumentElement.Name -eq 'Defs') {
      foreach ($n in $d.DocumentElement.ChildNodes) { if ($n.NodeType -eq 'Element') { $n } }
    }
  }
}
function Child([System.Xml.XmlNode]$n, [string]$name) {
  foreach ($c in $n.ChildNodes) { if ($c.NodeType -eq 'Element' -and $c.Name -eq $name) { return $c } }
  return $null
}
function Text([System.Xml.XmlNode]$n, [string]$name) { $c = Child $n $name; if ($c) { $c.InnerText.Trim() } else { $null } }

function Copy-Over($child, $current) {
  $inh = $child.Attributes['Inherit']
  if ($inh -and $inh.Value.ToLower() -eq 'false') {
    foreach ($x in @($current.ChildNodes)) { [void]$current.RemoveChild($x) }
    foreach ($x in @($child.ChildNodes)) { [void]$current.AppendChild($current.OwnerDocument.ImportNode($x, $true)) }
    foreach ($a in @($child.Attributes)) { if ($a.Name -ne 'Inherit') { $na = $current.OwnerDocument.CreateAttribute($a.Name); $na.Value = $a.Value; [void]$current.Attributes.Append($na) } }
    return
  }
  $current.Attributes.RemoveAll()
  foreach ($a in @($child.Attributes)) { [void]$current.Attributes.Append($current.OwnerDocument.ImportNode($a, $true)) }
  $text = $null; $hasEl = $false
  foreach ($c in $child.ChildNodes) { if ($c.NodeType -eq 'Text') { $text = $c } elseif ($c.NodeType -eq 'Element') { $hasEl = $true } }
  if ($text) {
    foreach ($x in @($current.ChildNodes)) { [void]$current.RemoveChild($x) }
    [void]$current.AppendChild($current.OwnerDocument.ImportNode($text, $true)); return
  }
  if (-not $hasEl) {
    if ($null -ne (@($current.ChildNodes | Where-Object { $_.NodeType -eq 'Element' }) | Select-Object -First 1)) { return }
    foreach ($x in @($current.ChildNodes)) { [void]$current.RemoveChild($x) }; return
  }
  foreach ($c in @($child.ChildNodes)) {
    if ($c.NodeType -ne 'Element') { continue }
    if ($c.Name -eq 'li') { [void]$current.AppendChild($current.OwnerDocument.ImportNode($c, $true)); continue }
    $e = Child $current $c.Name
    if ($e) { Copy-Over $c $e } else { [void]$current.AppendChild($current.OwnerDocument.ImportNode($c, $true)) }
  }
}
function Resolve-Def($node, $byName) {
  $pn = $node.GetAttribute('ParentName')
  if (-not $pn) { return $node.CloneNode($true) }
  if (-not $byName.ContainsKey($pn)) { throw "ParentName '$pn' not found" }
  $cur = Resolve-Def $byName[$pn] $byName
  $cur = $node.OwnerDocument.ImportNode($cur, $true)
  Copy-Over $node $cur
  return $cur
}

# --- Inputs -----------------------------------------------------------------------------
$patchFile = Join-Path $Root 'Mod/Patches/EponaInstruments.xml'
$provDefs = @(Read-Defs (Join-Path $Provider 'Defs'))
$byName = @{}; $byDef = @{}
foreach ($d in $provDefs) {
  $nm = $d.GetAttribute('Name'); if ($nm) { $byName[$nm] = $d }
  $dn = Text $d 'defName'; if ($dn) { $byDef["$($d.Name)/$dn"] = $d }
}
function Descends($n) { while ($n -and $n.GetAttribute("ParentName")) { $p = $n.GetAttribute("ParentName"); if ($p -eq "HeldMusicalInstrumentBase") { return $true }; $n = $byName[$p] }; return $false }
$provInstruments = @($provDefs | Where-Object { $_.Name -eq "ThingDef" -and $_.GetAttribute("Abstract") -ne "True" -and (Descends $_) })
Say "Provider 1.6: $($provDefs.Count) defs, $($provInstruments.Count) instruments carrying CompProp_PlayingMusic"

$gameThings = @{}; $gameStuffCats = @{}
foreach ($d in (Read-Defs $Data)) {
  $dn = Text $d 'defName'; if (-not $dn) { continue }
  if ($d.Name -eq 'ThingDef') { $gameThings[$dn] = 1 } elseif ($d.Name -eq 'StuffCategoryDef') { $gameStuffCats[$dn] = 1 }
}
foreach ($d in $provDefs) { $dn = Text $d 'defName'; if ($dn -and $d.Name -eq 'ThingDef') { $gameThings[$dn] = 1 } }
Say "Game Data + provider: $($gameThings.Count) ThingDefs, $($gameStuffCats.Count) StuffCategoryDefs"

# --- Patch guard: provider present, then absent ------------------------------------------
$patch = New-Object System.Xml.XmlDocument; $patch.Load($patchFile)
$op = $patch.SelectSingleNode('/Patch/Operation[@Class="PatchOperationConditional"]')
Check ($null -ne $op) 'patch root is one PatchOperationConditional'
$xpath = $op.SelectSingleNode('xpath').InnerText
$withProv = New-Object System.Xml.XmlDocument; $withProv.AppendChild($withProv.CreateElement('Defs')) | Out-Null
foreach ($d in $provDefs) { [void]$withProv.DocumentElement.AppendChild($withProv.ImportNode($d, $true)) }
$empty = New-Object System.Xml.XmlDocument; $empty.AppendChild($empty.CreateElement('Defs')) | Out-Null
Check ($null -ne $withProv.SelectSingleNode($xpath)) "guard '$xpath' matches when the provider is loaded"
Check ($null -eq $empty.SelectSingleNode($xpath)) 'guard matches nothing without the provider: no def is added, no invalid def is created'
$matchOp = $op.SelectSingleNode('match')
Check ($matchOp.GetAttribute('Class') -eq 'PatchOperationAdd' -and $matchOp.SelectSingleNode('xpath').InnerText -eq 'Defs') 'match branch is PatchOperationAdd on Defs'
Check ($null -eq $op.SelectSingleNode('nomatch')) 'no nomatch branch: nothing is added without the provider'
$added = @($matchOp.SelectNodes('value/*'))
Check ($added.Count -eq 3) "patch adds exactly 3 defs (found $($added.Count))"

$expected = @{
  'JP_GreatHighlandBagpipes' = @{ Research = 'PrimitiveInstruments'; Sound = 'MIC_Ocarina_Play';        Tex = 'Things/Items/Pipes/GreatHighlandPipes' }
  'JP_UilleannPipes'         = @{ Research = 'PrimitiveInstruments'; Sound = 'MIC_Ocarina_Play';        Tex = 'Things/Items/Pipes/UilleannPipes' }
  'JP_Accordion'             = @{ Research = 'StringedInstruments';  Sound = 'MIC_ElectronicOrgan_Play'; Tex = 'Things/Items/Pipes/Accordion' }
}
$fr = New-Object System.Xml.XmlDocument
$fr.Load((Join-Path $Root 'Mod/Languages/French/DefInjected/ThingDef/JoyPreservation.xml'))
$frKeys = @{}; foreach ($e in $fr.DocumentElement.ChildNodes) { if ($e.NodeType -eq 'Element') { $frKeys[$e.Name] = $e.InnerText.Trim() } }

$providerTicker = @($provInstruments | ForEach-Object { $t = Resolve-Def $_ $byName; Text $t 'tickerType' } | Sort-Object -Unique)
Say "Provider instruments' effective tickerType values: $($providerTicker -join ', ')"

foreach ($n in $added) {
  $name = Text $n 'defName'
  Say ''
  Say "== $name"
  Check ($expected.ContainsKey($name)) 'defName is one of the three expected'
  if (-not $expected.ContainsKey($name)) { continue }
  $exp = $expected[$name]

  $clash = @($provDefs | Where-Object { $_.Name -eq 'ThingDef' -and (Text $_ 'defName') -eq $name }).Count
  Check ($clash -eq 0) 'defName does not collide with any provider ThingDef'
  Check (-not $gameThings.ContainsKey($name) -or $clash -eq 0) 'defName does not collide with Core/DLC ThingDefs'

  $eff = Resolve-Def $n $byName
  Check ((Text $eff 'thingClass') -eq 'ThingWithComps') "effective thingClass ThingWithComps (got $(Text $eff 'thingClass'))"
  Check ((Text $eff 'category') -eq 'Item') 'effective category Item'
  $tk = Text $eff 'tickerType'
  Check ($providerTicker.Count -eq 1 -and $tk -eq $providerTicker[0]) "effective tickerType '$tk' equals every provider instrument's '$($providerTicker -join ',')' (Comp_PlayingMusic.CompTick starts the sound)"

  $comps = Child $eff 'comps'
  $liClasses = @($comps.ChildNodes | ForEach-Object { $_.GetAttribute('Class') })
  Check ($liClasses -contains 'MusicalInstruments.CompProperties_MusicalInstrument') 'comps: CompProperties_MusicalInstrument'
  Check ($liClasses -contains 'MusicalInstruments.CompProp_PlayingMusic') 'comps: CompProp_PlayingMusic'
  Check ($liClasses -contains 'CompProperties_Usable') 'comps inherited: CompProperties_Usable (Take to inventory)'
  Check ($liClasses -contains 'CompProperties_Art') 'comps inherited: CompProperties_Art'
  Check (@($comps.ChildNodes | Where-Object { $_.InnerXml -match '<compClass>CompQuality</compClass>' }).Count -eq 1) 'comps inherited: CompQuality'
  $mi = @($comps.ChildNodes | Where-Object { $_.GetAttribute('Class') -eq 'MusicalInstruments.CompProperties_MusicalInstrument' })[0]
  $ea = [double](Text $mi 'easiness'); $ex = [double](Text $mi 'expressiveness')
  Check (($ea -gt 0 -and $ea -le 1) -and ($ex -gt 0 -and $ex -le 1)) "easiness $ea and expressiveness $ex within (0,1]"
  $pm = @($comps.ChildNodes | Where-Object { $_.GetAttribute('Class') -eq 'MusicalInstruments.CompProp_PlayingMusic' })[0]
  $snd = Text $pm 'soundPlayInstrument'
  Check ($snd -eq $exp.Sound -and $byDef.ContainsKey("SoundDef/$snd")) "soundPlayInstrument $snd exists in the provider ($($exp.Sound) expected)"

  $rm = Child $eff 'recipeMaker'
  $rp = Text $rm 'researchPrerequisite'
  Check ($rp -eq $exp.Research) "effective researchPrerequisite $rp (expected $($exp.Research))"
  Check ($byDef.ContainsKey("ResearchProjectDef/$rp")) "research $rp exists in the provider"
  $users = @((Child $rm 'recipeUsers').ChildNodes | ForEach-Object { $_.InnerText.Trim() })
  Check ($users -contains 'TableMusicalInstruments') 'crafted at TableMusicalInstruments'
  Check (($byDef.Keys -contains 'ThingDef/TableMusicalInstruments')) 'TableMusicalInstruments exists in the provider'

  $gd = Child $eff 'graphicData'
  $tex = Text $gd 'texPath'
  Check ($tex -eq $exp.Tex) "texPath $tex"
  Check (Test-Path (Join-Path $Root "Mod/Textures/$tex.png")) 'texture file exists'
  Check (Test-Path (Join-Path $Root "Mod/Textures/${tex}_m.png")) 'mask file _m exists (CutoutComplex)'
  Check ((Text $gd 'graphicClass') -eq 'Graphic_Single') 'graphicClass overridden to Graphic_Single (single texture, no _north/_east)'

  $costStuff = [int](Text $eff 'costStuffCount')
  $cats = @((Child $eff 'stuffCategories').ChildNodes | ForEach-Object { $_.InnerText.Trim() })
  Check (($costStuff -gt 0) -eq ($cats.Count -gt 0)) "costStuffCount $costStuff consistent with stuffCategories [$($cats -join ',')]"
  foreach ($c in $cats) { Check ($gameStuffCats.ContainsKey($c)) "stuff category $c exists" }
  $cl = Child $eff 'costList'
  foreach ($c in @($cl.ChildNodes)) { Check ($gameThings.ContainsKey($c.Name)) "costList item $($c.Name) exists"; Check ([int]$c.InnerText -gt 0) "costList $($c.Name) count > 0" }
  $sb = Child $eff 'statBases'
  Check ([double](Text $sb 'WorkToMake') -gt 0) 'WorkToMake > 0'
  Check ([double](Text $sb 'Mass') -gt 0) 'Mass > 0'

  Check (-not [string]::IsNullOrWhiteSpace((Text $eff 'label'))) 'English label present (native Def value)'
  Check (-not [string]::IsNullOrWhiteSpace((Text $eff 'description'))) 'English description present (native Def value)'
  Check ($frKeys.ContainsKey("$name.label") -and $frKeys["$name.label"]) 'French label injected'
  Check ($frKeys.ContainsKey("$name.description") -and $frKeys["$name.description"]) 'French description injected'
}
$orphans = @($frKeys.Keys | Where-Object { $expected.Keys -notcontains ($_ -replace '\.(label|description)$', '') })
Check ($orphans.Count -eq 0) "no French key targets an unknown def ($($orphans -join ', '))"
Check ($frKeys.Count -eq 6) "French file holds exactly 6 entries (found $($frKeys.Count))"

Say ''
Say $(if ($script:fail -eq 0) { 'RESULT: all assertions passed' } else { "RESULT: $($script:fail) assertion(s) FAILED" })
if ($OutFile) { $script:lines | Set-Content -Path $OutFile -Encoding utf8 }
exit $(if ($script:fail -eq 0) { 0 } else { 1 })
