import { start, end } from '../utils/wrapper.js'
import { echoSuccess } from '../utils/echo.js'
import { exec } from '../utils/exec.js'

export default async (options) => {

  await start()

  await exec('docker', ['container', 'rm', '$(docker container ls -aq)'])

  echoSuccess('Local environement was killed')

  end()

}