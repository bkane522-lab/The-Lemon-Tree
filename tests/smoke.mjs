import fs from 'node:fs';
const root=new URL('../',import.meta.url);
const must=['.env.example','src/config/brand.ts','public/brand/lemontree.png','supabase/schema.sql','supabase/policies.sql','GUIDE-ADMIN.md'];
for(const f of must){const p=new URL(f,root);if(!fs.existsSync(p)) throw new Error(`Fichier manquant: ${f}`)}
const brand=fs.readFileSync(new URL('src/config/brand.ts',root),'utf8');
if(!brand.includes("brandName: 'The Lemon Tree'")) throw new Error('Nom officiel incorrect');
if(!brand.includes("brandTagline: 'INTERIOR DESIGN'")) throw new Error('Slogan officiel incorrect');
const env=fs.readFileSync(new URL('.env.example',root),'utf8');
if(!env.includes('SUPABASE_SERVICE_ROLE_KEY=')) throw new Error('Variable service role manquante');
if(env.includes('SUPABASE_SERVICE_KEY=')||env.includes('SUPABASE_SERVICE_ROLE=')) throw new Error('Convention de variable incohérente');
const policies=fs.readFileSync(new URL('supabase/policies.sql',root),'utf8');
if(!policies.includes('ai_admin_only')) throw new Error('RLS IA admin manquante');
console.log('Smoke tests: OK');
