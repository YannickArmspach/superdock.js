import { existsSync } from 'fs'
import { exec } from '../utils/exec.js'
import globals from '../utils/globals.js'
import { start } from '../utils/payload.js'
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

}