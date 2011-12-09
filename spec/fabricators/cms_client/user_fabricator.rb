Fabricator(:directory, :from => SsoClient::Directory) do
  entry_name 'directory'
  parent { SsoClient::Entry.root }
end
