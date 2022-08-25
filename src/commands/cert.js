import globals from '../utils/globals.js'
import { start, end } from '../utils/wrapper.js'
import { echoSuccess } from '../utils/echo.js'
import { exec } from '../utils/exec.js'

import shell from 'shelljs'

export default async (options) => {

  await start()

  const domains_custom = [
    'plist.dev', 
    'api.plist.dev'
  ]

  const domains = [
    ...domains_custom,
    'adminer.superdock.dev',
    'mailhog.superdock.dev',
    'rediscommander.superdock.dev',
  ]

  for (let i = 0; i < domains.length; i++) {
    
    const domain = domains[i]
    const dir = globals.conf.dirname + '/certificates/' + domain

    await shell.mkdir('-p', [ dir ])
    
    shell.chmod('u+x', globals.path.scripts + '/cert.sh')

    await exec( globals.path.scripts + '/cert.sh' , [domain, dir] )

    /* TODO: test cert.sh cmd with js exec()
    await exec('openssl', ['genrsa', '-aes256', '-passout', 'pass:gsahdg', '-out', dir + 'cert.pass.key', '4096'])
    await exec('openssl', ['rsa', '-passin', 'pass:gsahdg', '-in', dir + 'cert.pass.key', '-out', dir + 'cert.key'])
    await exec('rm', [dir + 'cert.pass.key'])
    await exec('openssl', ['req', '-new', '-key', dir + 'cert.key', '-out', dir + 'cert.csr', '-subj', '/C=FR/ST=Paris/L=Paris/O=' + domain + '/OU=' + domain + '/CN=' + domain + ''])
    await exec('openssl', ['x509', '-req', '-sha256', '-days', '365', '-in', dir + 'cert.csr', '-signkey', dir + 'cert.key', '-out', dir + 'cert.crt'])
    await exec('osascript', ['-e', 'do shell script "security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain ' + dir + 'cert.crt" with prompt "Superdock wants to store ' + domain + ' (' + dir + 'cert.crt) SSL certification to keychain." with administrator privileges'] )
    */

    // await exec('osascript', ['-e', 'do shell script "sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain ' + dir +  '/' + domain +  '.pem" with prompt "Superdock wants to store ' + domain + ' SSL certification to keychain." with administrator privileges'] )

    await exec('sudo', ['security', 'add-trusted-cert', '-d', '-r', 'trustRoot', '-k', '/Library/Keychains/System.keychain', dir +  '/' + domain +  '.pem'])

    echoSuccess('Certs created for ' + domain )

  }

}