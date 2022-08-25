import { start, end } from '../utils/wrapper.js'
import { echoSuccess } from '../utils/echo.js'
import { exec } from '../utils/exec.js'

export default async (options) => {

  await start()

  await exec('docker-compose', ['down', '--remove-orphans'])

  echoSuccess('Local environement is down')

  end()
 
}