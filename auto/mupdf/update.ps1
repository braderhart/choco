import-module au

$releases = 'https://mupdf.com/downloads'

function global:au_BeforeUpdate() { Get-RemoteFiles -Purge -NoSuffix }

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex         = 'windows.zip$'
  $url           = $download_page.links | ? href -match $regex | select -First 1 -expand href
  $version       = $url -split '-|.zip' | select -Index 1

  @{
    URL32   = "$releases/$url"
    Version = $version
  }
}

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.md" = @{
      "(checksum32:).*" = "`${1} $($Latest.Checksum32)"
    }
  }
}

update -ChecksumFor none
