import globals from '../utils/globals.js'
import { existsSync } from 'fs'
import { echoInfo, echoSuccess } from '../utils/echo.js'
import { exec } from '../utils/exec.js'

import shelljs from 'shelljs'
const { mkdir, chmod, exit } = shelljs;

export default async (options) => {

  let domains = []
  
  Object.values(globals.projects).forEach((project) => {
    domains.push( project.local.domain )
  })

  await exec( globals.path.scripts + '/cert.sh' , [ globals.conf.dirname + '/certificates', ...domains ] )

}