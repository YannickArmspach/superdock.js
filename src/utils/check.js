import { existsSync } from 'fs'
import { echoError } from './echo.js'
import globals from './globals.js'

import shelljs from 'shelljs'
const { which, exit } = shelljs

export default async () => {

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