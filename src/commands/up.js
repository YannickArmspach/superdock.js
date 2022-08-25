import { start, end } from '../utils/wrapper.js'
import { echoSpacer, echoSuccess } from '../utils/echo.js'
import { exec } from '../utils/exec.js'
import globals from '../utils/globals.js'

export default async (options) => {

  await start()

  await exec('docker-compose', ['up', '-d', '--build', '--remove-orphans', '--force-recreate', '--renew-anon-volumes'])
  
  echoSuccess('Local environement is up')

  end()

}