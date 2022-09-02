import { start } from '../utils/payload.js'
import { echoSuccess } from '../utils/echo.js'
import { exec } from '../utils/exec.js'

export default async (options) => {

  await start()

  // TODO: implement db sync
  // await exec('docker-compose', ['down', '--remove-orphans'])
  //docker exec -i mysql mysql -u=dev -p=dev mysql < dev/database/production/dump.sql
  
  echoSuccess('Database imported in local environement')
 
}