import { existsSync } from 'fs'
import shelljs from 'shelljs'

import { echoError } from './echo.js'
import globals from './globals.js'

export default async () => {

  const { which, exit } = shelljs

  if ( ! existsSync(globals.conf.filename) ) {
    echoError('superdock config not founded in this directory')
    exit()
  }

  if ( ! which('git') ) {
    echoError('Sorry, this script requires git')
    exit()
  }

  if ( ! which('docker') ) {
    echoError('Sorry, this script requires docker')
    exit()
  }

  if ( ! which('openssl') ) {
    echoError('Sorry, this script requires openssl')
    exit()
  }

  if ( ! existsSync(globals.conf.dirname) ) {
    echoError('Error, superdock directory not founded, please use "sd init" fix it')  
    exit()
  }
}