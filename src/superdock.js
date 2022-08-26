#!/usr/bin/env node

import cli from "commander"

import init from "./commands/init.js"
import up from "./commands/up.js"
import down from "./commands/down.js"
import kill from "./commands/kill.js"
import ssh from "./commands/ssh.js"
import logs from "./commands/logs.js"
import cert from "./commands/cert.js"

cli
  .name("superdock")
  .description("Superdock CLI")

cli
  .command("init")
  .description("Init superdock")
  .action(init)

cli
  .command("up")
  .description("Start local environement")
  .action(up)

cli
  .command("down")
  .description("Stop local environement")
  .action(down)

cli
  .command("kill")
  .description("Kill local environement")
  .action(kill)

cli
  .command("ssh")
  .description("Connect in environement")
  .argument("[env]", "Environement")
  .action(ssh)

cli
  .command("logs")
  .description("Stream local logs")
  .action(logs)

cli
  .command("cert")
  .description("Generate ssl self signed certificate")
  .action(cert)

// cli
//   .command("scriptName")
//   .argument("[argName]", "Argument description")
//   .option("-o, --option", "Option description")
//   .description("Description")
//   .action(scriptExport);

cli.parse(process.argv);

