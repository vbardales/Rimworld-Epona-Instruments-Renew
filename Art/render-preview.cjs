// Reproducible artwork composition; dependencies may be supplied through NODE_PATH.
const fs = require('fs');
const path = require('path');
const { chromium } = require('playwright');
const sharp = require('sharp');
const art = __dirname;
const palette = JSON.parse(fs.readFileSync(path.join(art, 'preview-palette.json')));
const image = fs.readFileSync(path.join(art, 'Preview.png')).toString('base64');
const html = `<!doctype html><html><meta charset="utf-8"><style>
*{box-sizing:border-box}body{margin:0;width:896px;height:504px;overflow:hidden;font-family:"Segoe UI",system-ui,sans-serif;color:${palette.inkPrimary};background:url(data:image/png;base64,${image}) center/cover}
.veil{position:absolute;inset:0;background:radial-gradient(ellipse 850px 650px at top left,${palette.veil}ef 0%,${palette.veil}d9 42%,${palette.veil}00 85%)}
.copy{position:absolute;left:50px;top:54px;width:450px;text-shadow:0 3px 10px rgba(0,0,0,.75)}
h1,p{margin:0}h1{font-size:46px;font-weight:600;line-height:1.1;letter-spacing:0}h1 span{font-size:.65em;color:${palette.inkSecondary}}
.tag{font-size:24px;font-weight:400;line-height:1.1;letter-spacing:.2px;color:${palette.inkSecondary};margin-top:8px}
.rule{width:58px;height:3px;background:${palette.accent};margin-top:20px;margin-bottom:16px}
.summary{font-size:21px;font-weight:400;line-height:1.45;width:430px}
.badge{position:absolute;right:0;top:0;width:80px;height:80px;background:${palette.accent};clip-path:polygon(0 0,100% 0,100% 100%)}
.version{position:absolute;left:869px;top:27px;transform:translate(-50%,-50%) rotate(45deg);font-size:26px;font-weight:700;line-height:1;color:${palette.badgeInk}}
</style><div class="veil"></div><div class="copy"><h1>Epona<br>Instruments <span>Renew</span></h1><p class="tag">(unofficial)</p><div class="rule"></div><p class="summary">Bagpipes and accordion<br>for your colony.</p></div><div class="badge"></div><div class="version">1.6</div></html>`;
fs.writeFileSync(path.join(art, 'preview.html'), html);
function luminance(rgb) {const v=rgb.map(c=>{c/=255;return c<=.04045?c/12.92:((c+.055)/1.055)**2.4});return .2126*v[0]+.7152*v[1]+.0722*v[2]}
function hex(c){return c.match(/[0-9a-f]{2}/gi).map(x=>parseInt(x,16))}
function contrast(a,b){return (Math.max(a,b)+.05)/(Math.min(a,b)+.05)}
(async()=>{
const browser=await chromium.launch({headless:true,executablePath:process.env.CHROME_PATH||'C:/Program Files/Google/Chrome/Application/chrome.exe'});
const page=await browser.newPage({viewport:{width:896,height:504},deviceScaleFactor:1});
await page.setContent(html);await page.evaluate(()=>document.fonts.ready);
const font=await page.evaluate(()=>document.fonts.check('600 46px "Segoe UI"'));
const regions=await page.evaluate(()=>['h1','.tag','.summary'].map(selector=>{const r=document.querySelector(selector).getBoundingClientRect();return {selector,x:r.x,y:r.y,width:r.width,height:r.height}}));
await page.screenshot({path:path.join(art,'preview-render.png')});
await page.addStyleTag({content:'.copy{visibility:hidden}.version{visibility:hidden}'});
await page.screenshot({path:path.join(art,'preview-background.png')});
await browser.close();
const final=path.join(art,'../Mod/About/Preview.png');
await sharp(path.join(art,'preview-render.png')).png({compressionLevel:9}).toFile(final);
await sharp(final).resize(268,151).png().toFile(path.join(art,'Preview-268.png'));
const {data,info}=await sharp(path.join(art,'preview-background.png')).removeAlpha().raw().toBuffer({resolveWithObject:true});
const checks=regions.map(r=>{let minimum=Infinity;const inks=r.selector==='h1'?[palette.inkPrimary,palette.inkSecondary]:[r.selector==='.tag'?palette.inkSecondary:palette.inkPrimary];for(let y=Math.floor(r.y);y<Math.ceil(r.y+r.height);y++)for(let x=Math.floor(r.x);x<Math.ceil(r.x+r.width);x++){const i=(y*info.width+x)*info.channels;const bg=luminance([...data.subarray(i,i+3)]);for(const ink of inks)minimum=Math.min(minimum,contrast(luminance(hex(ink)),bg))}return {...r,minimumContrast:minimum}});
const badgeContrast=contrast(luminance(hex(palette.badgeInk)),luminance(hex(palette.accent)));
const report={font:'Segoe UI',fontAvailable:font,size:[896,504],bytes:fs.statSync(final).size,checks,badgeContrast};
fs.writeFileSync(path.join(art,'preview-qa.json'),JSON.stringify(report,null,2)+'\n');
console.log(JSON.stringify(report));
if(!font||report.bytes>=1000000||checks.some(x=>x.minimumContrast<4.5)||badgeContrast<4.5)throw Error('Preview QA failed');
})();
