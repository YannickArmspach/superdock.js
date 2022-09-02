import { start, infos } from '../utils/payload.js'
import { echoInfo, echoSuccess } from '../utils/echo.js'
import { exec } from '../utils/exec.js'

export default async (options) => {

  await start()

  echoInfo('Start local environement')

  await exec('docker-compose', ['up', '-d', '--build', '--remove-orphans', '--force-recreate', '--renew-anon-volumes'])
  
  echoSuccess('Local environement is up')

  infos()
  
}