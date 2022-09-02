import { infos, start } from '../utils/payload.js'

export default async (options) => {

  await start()

  infos()

}