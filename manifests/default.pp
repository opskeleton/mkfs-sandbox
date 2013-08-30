group{ 'puppet': ensure  => present }

node 'ubuntu.local' {
  class{'partition': device => '/dev/sdb', dest => '/mnt/drive/'}
}

node 'centos.local' {
  class{'partition': device => '/dev/sdb', dest => '/mnt/drive/'  }
}
