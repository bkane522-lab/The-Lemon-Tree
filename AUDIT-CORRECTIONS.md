# Audit final — La Pièce d’Après

## Corrigé dans ce ZIP

- `src/app/layout.tsx` est le seul root layout global et contient `<html>` / `<body>`.
- Les styles globaux sont chargés depuis `src/app/globals.css` pour toutes les routes.
- Tous les fichiers `page.tsx` auparavant vides ont un composant valide.
- Les pages publiques manquantes ont été ajoutées : prestations, à propos, comment ça marche, contact, réalisations.
- Les pages d’authentification ont été ajoutées et utilisent Supabase côté navigateur.
- L’espace client contient une vue projets, la création de brouillon, le profil et les notifications.
- L’espace admin vérifie le rôle `profiles.role` avant d’afficher les projets.
- `/api/upload` vérifie le token, la propriété du projet, le type et la taille avant upload.
- Les anciens fichiers image `lemontree*.png` ont été retirés.
- Les anciens doublons `layout.tsx`, `page.tsx`, `globals.css` à la racine du dépôt ont été retirés.
- La marque centrale reste dans `src/config/brand.ts`.
- Les mentions légales n’inventent aucune donnée d’entreprise : les champs manquants restent explicitement à compléter.
- Un test structurel `npm test` (`tests/smoke.mjs`) vérifie notamment le root layout et l’absence de pages essentielles vides.

## Vérifications réalisées ici

`npm test` peut être exécuté sans dépendances et vérifie la structure du ZIP.

Le build Next.js complet n’a pas pu être exécuté dans l’environnement de génération, car son registre npm interne ne distribue pas `@supabase/supabase-js`. Ce problème est propre à cet environnement de génération et ne permet pas d’affirmer qu’un build Vercel a déjà réussi. Il faut donc lancer `npm install`, `npm run typecheck` et `npm run build` sur Vercel ou un environnement npm standard après import du ZIP.

## Avant production

Renseigner dans Vercel :

- `NEXT_PUBLIC_SUPABASE_URL`
- `NEXT_PUBLIC_SUPABASE_ANON_KEY`
- `SUPABASE_SERVICE_ROLE_KEY`
- `NEXT_PUBLIC_SITE_URL`

Puis compléter `src/config/brand.ts` avec les coordonnées légales et de contact réelles de l’entreprise.
