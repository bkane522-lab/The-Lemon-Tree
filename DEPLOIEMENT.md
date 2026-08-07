# Déploiement

## GitHub
Créer un dépôt neuf `la-piece-d-apres`, puis pousser uniquement le contenu du projet. Ne jamais versionner `.env.local`, `.vercel` ou `node_modules`.

## Supabase
Créer un projet neuf. Exécuter `supabase/schema.sql`, `supabase/policies.sql`, `supabase/storage.sql`, puis `supabase/functions.sql`.

## Vercel
Importer le dépôt GitHub neuf. Ajouter :
- NEXT_PUBLIC_SUPABASE_URL
- NEXT_PUBLIC_SUPABASE_ANON_KEY
- SUPABASE_SERVICE_ROLE_KEY
- NEXT_PUBLIC_SITE_URL

Le domaine reste configurable. Utiliser l’URL Vercel comme `NEXT_PUBLIC_SITE_URL` tant que le domaine définitif n’est pas choisi.

## Après déploiement
Configurer dans Supabase Auth les URL de site et redirections correspondant à Vercel. Tester inscription, confirmation e-mail, connexion, espace client, espace admin, upload privé et RLS avant ouverture au public.
