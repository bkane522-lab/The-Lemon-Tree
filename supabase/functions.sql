create or replace function public.admin_set_project_status(p_project_id uuid, p_new_status public.project_status, p_public_message text default null)
returns void language plpgsql security definer set search_path=public as $$
declare old_status public.project_status;
begin
  if not public.is_admin(auth.uid()) then raise exception 'forbidden'; end if;
  select status into old_status from public.projects where id=p_project_id for update;
  if old_status is null then raise exception 'project_not_found'; end if;
  update public.projects set status=p_new_status, is_submitted=(p_new_status<>'draft') where id=p_project_id;
  insert into public.project_status_history(project_id,previous_status,new_status,changed_by,public_message)
  values(p_project_id,old_status,p_new_status,auth.uid(),p_public_message);
end $$;

create or replace function public.admin_set_user_status(p_user_id uuid, p_status public.account_status)
returns void language plpgsql security definer set search_path=public as $$
begin
  if not public.is_admin(auth.uid()) then raise exception 'forbidden'; end if;
  update public.profiles set account_status=p_status where id=p_user_id;
end $$;
