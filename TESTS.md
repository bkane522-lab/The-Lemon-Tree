# Tests

## Commandes prévues
- `npm test`
- `npm run lint`
- `npm run typecheck`
- `npm run build`

## Couverture fonctionnelle à terminer avant livraison finale
- inscription / confirmation / connexion / reset ;
- impossibilité de choisir admin publiquement ;
- RLS multi-utilisateurs ;
- création et reprise d’un brouillon ;
- questionnaire ;
- validation des mesures ;
- upload, suppression, taille, MIME, reprise ;
- rendez-vous ;
- notes internes invisibles au client ;
- changement de statut admin ;
- accès au Laboratoire d’inspiration IA réservé admin ;
- absence de clé secrète dans le bundle frontend ;
- responsive 360/390/430/768/1024/1440.

Le test `tests/smoke.mjs` vérifie la structure et quelques invariants statiques sans nécessiter Supabase.
