# The Lemon Tree — INTERIOR DESIGN

Prototype professionnel neuf pour une activité de décoration d’intérieur.

## Stack
Next.js App Router, TypeScript, Tailwind CSS, Supabase Auth/PostgreSQL/Storage, Vercel.

## Identité
La marque est centralisée dans `src/config/brand.ts`. Le logo principal fourni est `public/brand/lemontree.png`. La variante noire fournie est conservée dans `public/brand/lemontree-dark.png`. Aucun logo n’est généré ni redessiné.

## Démarrage
1. Copier `.env.example` vers `.env.local`.
2. Renseigner les 4 variables.
3. Installer les dépendances : `npm install`.
4. Exécuter les scripts SQL Supabase dans l’ordre indiqué dans `supabase/README.md`.
5. Lancer `npm run dev`.

## Vérifications avant production
`npm test`, `npm run lint`, `npm run typecheck`, `npm run build`.

## État du prototype initial
Architecture, identité, pages publiques principales, écrans de base client/admin, schéma SQL, RLS, stockage, PWA et documentation initiale sont présents. Les formulaires visuels ne sont pas encore tous reliés aux mutations Supabase : voir `TESTS.md` et `DEPLOIEMENT.md`.
