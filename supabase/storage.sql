insert into storage.buckets(id,name,public,file_size_limit,allowed_mime_types) values
('project-images','project-images',false,10485760,array['image/jpeg','image/png','image/webp','image/heic']),
('project-documents','project-documents',false,20971520,array['application/pdf','image/jpeg','image/png','image/webp']),
('avatars','avatars',false,5242880,array['image/jpeg','image/png','image/webp']),
('ai-inspirations','ai-inspirations',false,10485760,array['image/jpeg','image/png','image/webp'])
on conflict(id) do nothing;

create policy storage_owner_read on storage.objects for select to authenticated using (
  bucket_id in ('project-images','project-documents','avatars') and (storage.foldername(name))[1]=auth.uid()::text
  or public.is_admin()
);
create policy storage_owner_insert on storage.objects for insert to authenticated with check (
  bucket_id in ('project-images','project-documents','avatars') and (storage.foldername(name))[1]=auth.uid()::text
);
create policy storage_owner_delete on storage.objects for delete to authenticated using (
  bucket_id in ('project-images','project-documents','avatars') and (storage.foldername(name))[1]=auth.uid()::text
  or public.is_admin()
);
create policy ai_storage_admin_only on storage.objects for all to authenticated using (bucket_id='ai-inspirations' and public.is_admin()) with check (bucket_id='ai-inspirations' and public.is_admin());
