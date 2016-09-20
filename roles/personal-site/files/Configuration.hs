module Configuration (config) where

import Hakyll.Core.Configuration

config :: Configuration
config =
  defaultConfiguration { deployCommand = "rsync -a _site/* /var/www/meosite" }
