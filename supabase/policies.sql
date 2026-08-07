create or replace function public.is_admin(uid uuid default auth.uid()) returns boolean language sql stable security definer set search_path=public as $$
  select exists(select 1 from public.profiles p where p.id=uid and p.role='admin' and p.account_status='active');
$$;
revoke all on function public.is_admin(uuid) from public;
grant execute on function public.is_admin(uuid) to authenticated;

alter table public.profiles enable row level security;
alter table public.projects enable row level security;
alter table public.project_answers enable row level security;
alter table public.project_measurements enable row level security;
alter table public.project_files enable row level security;
alter table public.appointments enable row level security;
alter table public.project_messages enable row level security;
alter table public.admin_notes enable row level security;
alter table public.project_status_history enable row level security;
alter table public.services enable row level security;
alter table public.notifications enable row level security;
alter table public.contact_requests enable row level security;
alter table public.app_settings enable row level security;
alter table public.ai_inspirations enable row level security;

create policy profiles_select_self_or_admin on public.profiles for select to authenticated using (id=auth.uid() or public.is_admin());
create policy profiles_update_self_safe on public.profiles for update to authenticated using (id=auth.uid()) with check (id=auth.uid());
-- Le rôle et account_status doivent être modifiés uniquement via action serveur admin; les grants ci-dessous retirent ces colonnes aux clients.
revoke update(role, account_status) on public.profiles from authenticated;
grant update(first_name,last_name,phone,avatar_url) on public.profiles to authenticated;

create policy projects_own_or_admin_select on public.projects for select to authenticated using (user_id=auth.uid() or public.is_admin());
create policy projects_own_insert on public.projects for insert to authenticated with check (user_id=auth.uid());
create policy projects_own_draft_update on public.projects for update to authenticated using (user_id=auth.uid() and status='draft') with check (user_id=auth.uid() or public.is_admin());
create policy projects_admin_update on public.projects for update to authenticated using (public.is_admin()) with check (public.is_admin());

create policy answers_access on public.project_answers for select to authenticated using (exists(select 1 from public.projects p where p.id=project_id and (p.user_id=auth.uid() or public.is_admin())));
create policy answers_client_write on public.project_answers for all to authenticated using (exists(select 1 from public.projects p where p.id=project_id and p.user_id=auth.uid() and p.status='draft')) with check (exists(select 1 from public.projects p where p.id=project_id and (p.user_id=auth.uid() or public.is_admin())));

create policy measurements_access on public.project_measurements for select to authenticated using (exists(select 1 from public.projects p where p.id=project_id and (p.user_id=auth.uid() or public.is_admin())));
create policy measurements_write on public.project_measurements for all to authenticated using (exists(select 1 from public.projects p where p.id=project_id and (p.user_id=auth.uid() or public.is_admin()))) with check (exists(select 1 from public.projects p where p.id=project_id and (p.user_id=auth.uid() or public.is_admin())));

create policy files_access on public.project_files for select to authenticated using (user_id=auth.uid() or public.is_admin());
create policy files_client_insert on public.project_files for insert to authenticated with check (user_id=auth.uid() and exists(select 1 from public.projects p where p.id=project_id and p.user_id=auth.uid()));
create policy files_delete on public.project_files for delete to authenticated using (user_id=auth.uid() or public.is_admin());

create policy appointments_access on public.appointments for select to authenticated using (user_id=auth.uid() or public.is_admin());
create policy appointments_client_insert on public.appointments for insert to authenticated with check (user_id=auth.uid() and exists(select 1 from public.projects p where p.id=project_id and p.user_id=auth.uid()));
create policy appointments_admin_update on public.appointments for update to authenticated using (public.is_admin()) with check (public.is_admin());

create policy messages_select on public.project_messages for select to authenticated using ((not is_internal and exists(select 1 from public.projects p where p.id=project_id and p.user_id=auth.uid())) or public.is_admin());
create policy messages_client_insert on public.project_messages for insert to authenticated with check (sender_id=auth.uid() and is_internal=false and exists(select 1 from public.projects p where p.id=project_id and p.user_id=auth.uid()));
create policy messages_admin_all on public.project_messages for all to authenticated using (public.is_admin()) with check (public.is_admin());

create policy admin_notes_admin_only on public.admin_notes for all to authenticated using (public.is_admin()) with check (public.is_admin());
create policy history_select on public.project_status_history for select to authenticated using (exists(select 1 from public.projects p where p.id=project_id and (p.user_id=auth.uid() or public.is_admin())));
create policy history_admin_write on public.project_status_history for insert to authenticated with check (public.is_admin());
create policy services_public_select on public.services for select to anon,authenticated using (active=true or public.is_admin());
create policy services_admin_write on public.services for all to authenticated using (public.is_admin()) with check (public.is_admin());
create policy notifications_own on public.notifications for select to authenticated using (user_id=auth.uid() or public.is_admin());
create policy notifications_own_update on public.notifications for update to authenticated using (user_id=auth.uid()) with check (user_id=auth.uid());
create policy contacts_public_insert on public.contact_requests for insert to anon,authenticated with check (true);
create policy contacts_admin_select on public.contact_requests for select to authenticated using (public.is_admin());
create policy settings_public_select on public.app_settings for select to anon,authenticated using (is_public=true or public.is_admin());
create policy settings_admin_all on public.app_settings for all to authenticated using (public.is_admin()) with check (public.is_admin());
create policy ai_admin_only on public.ai_inspirations for all to authenticated using (public.is_admin()) with check (public.is_admin());
