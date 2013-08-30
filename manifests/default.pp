group{ 'puppet': ensure  => present }

node 'ubuntu.local' {
  class{'mkfs': device => '/dev/sdb', dest => '/mnt/drive/'}
}

node 'centos.local' {
  class{'mkfs': device => '/dev/sdb', dest => '/mnt/drive/'  }
}
