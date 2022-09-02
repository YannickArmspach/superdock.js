import globals from '../utils/globals.js'
import { echoInfo, echoSuccess } from '../utils/echo.js'
import { exec } from '../utils/exec.js'

import shelljs from 'shelljs'
const { chmod } = shelljs;

export default async (options) => {

  let domains = []

  Object.values(globals.projects).forEach((project) => {
    domains.push( project.local.domain )
  })

  await exec( globals.path.scripts + '/hosts.sh' , [ ...domains ] )

}