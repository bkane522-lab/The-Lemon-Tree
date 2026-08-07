# La Pièce d’Après

Application web professionnelle pour une activité de décoration et d’aménagement intérieur sur mesure.

**Signature :** Intérieur sur mesure, espaces qui vous ressemblent.

## Stack
Next.js App Router, TypeScript, Tailwind CSS, Supabase Auth/PostgreSQL/Storage, Vercel.

## Identité
La marque est centralisée dans `src/config/brand.ts`. Le logo principal validé est `public/brand/logo-primary.png`. Les autres emplacements de logo utilisent actuellement la même identité validée afin de préserver la cohérence de marque jusqu’à la création éventuelle de déclinaisons dédiées.

Palette principale : ivoire, beige lin, taupe, terracotta, brun noyer, vert sauge, vert profond, noir encre et blanc cassé.

## Démarrage
1. Copier `.env.example` vers `.env.local`.
2. Renseigner les variables d’environnement sans jamais versionner les clés réelles.
3. Installer les dépendances : `npm install`.
4. Exécuter les scripts SQL Supabase dans l’ordre indiqué dans `supabase/README.md`.
5. Lancer `npm run dev`.

## Vérifications avant production
Exécuter `npm test`, `npm run lint`, `npm run typecheck` et `npm run build`.

## État actuel
L’identité « La Pièce d’Après » est désormais centralisée dans le projet. L’architecture, les premiers écrans, le schéma SQL, les politiques RLS, le stockage, la PWA et la documentation initiale sont présents. Les fonctionnalités métier doivent encore être reliées et testées avec une instance Supabase réelle avant mise en production.
