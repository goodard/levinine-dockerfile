#
define dockerfile::config::multistage
  (
    String $dockerfile,
    Hash   $conf,
    String $ensure = 'present',
  )
  {
    concat { $dockerfile:
      ensure => $ensure,
    }

    $stage_defaults = {
      dockerfile => $dockerfile,
    }

    $unique_stages = prefix($conf, "${name}-")

    create_resources('dockerfile::config::stage', $unique_stages, $stage_defaults)
  }