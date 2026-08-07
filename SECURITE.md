# Sécurité

- RLS activée sur les tables métier.
- Le client ne peut consulter que ses propres projets/fichiers/rendez-vous/notifications.
- Les messages `is_internal=true`, `admin_notes` et `ai_inspirations` sont réservés aux admins.
- Le rôle admin n’existe pas dans le formulaire public.
- `SUPABASE_SERVICE_ROLE_KEY` est réservée au serveur.
- Les buckets sont privés ; utiliser des URL signées après autorisation.
- Le middleware protège `/espace-client` et `/admin` ; la sécurité principale reste également imposée par RLS.
- Aucune erreur brute Supabase ne doit être présentée à l’utilisateur final.
- Les uploads doivent encore être reliés à une route serveur avec validation MIME/taille et renommage sécurisé avant production.
