group{ 'puppet': ensure  => present }

node 'ubuntu.local' {
  file{'/mnt/drive-a': ensure    => directory} ->
  mkfs::device{'/dev/sdb':  dest => '/mnt/drive-a/'}

  file{'/mnt/drive-b': ensure    => directory} ->
  mkfs::device{'/dev/sdc':  dest => '/mnt/drive-b/'}
}

node 'centos.local' {
  file{'/mnt/drive-a': ensure    => directory} ->
  mkfs::device{'/dev/sdb':  dest => '/mnt/drive-a/'}

  file{'/mnt/drive-b': ensure    => directory} ->
  mkfs::device{'/dev/sdc':  dest => '/mnt/drive-b/'}
}
