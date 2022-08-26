import { existsSync } from 'fs'
import { exec } from '../utils/exec.js'
import globals from '../utils/globals.js'
import { start, end } from '../utils/wrapper.js'
import { echoWarning, echoSuccess } from '../utils/echo.js'

import shelljs from 'shelljs'
const { mkdir } = shelljs;

export default async (options) => {

  await start(false)

  if ( existsSync(globals.conf.filename) ) {
  
    echoWarning('You cannot initialize, a .superdock.yml file already exists') 
  
  } else {

    await exec('cp', [ 
      globals.path.templates + '/' + globals.conf.filename, 
      globals.path.project + '/' + globals.conf.filename 
    ])

    echoSuccess('.superdock.yml configuration file created')
  
  }

  if ( existsSync(globals.conf.dirname) ) {

    echoWarning('You cannot create the superdock directory, it already exists') 
  
  } else {

    mkdir('-p', [
      globals.conf.dirname + '/certificates', 
      globals.conf.dirname + '/databases/local', 
      globals.conf.dirname + '/databases/staging', 
      globals.conf.dirname + '/databases/production',
      globals.conf.dirname + '/docker',
      globals.conf.dirname + '/scripts'
    ])
    
    echoSuccess('/superdock directory generated')

  }

  //create certificates if not exist

  end()

}