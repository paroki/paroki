<?php

/*
 * This file is part of the Sistim Informasi Antar Paroki (SIAP) project.
 *
 * (c) Anthonius Munthi <me@itstoni.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

declare(strict_types=1);

/*
 * This file is part of the Omed project.
 *
 * (c) Anthonius Munthi <me@itstoni.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace SIAP\Core\Command;

use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Process\Process;

class GenerateJWTKeyCommand extends Command
{
    private $pubKeyPath;

    private $secKeyPath;

    private $passphrase;

    public function __construct(
        $secKeyPath, $pubKeyPath, $passphrase
    ) {
        $this->secKeyPath = $secKeyPath;
        $this->pubKeyPath = $pubKeyPath;
        $this->passphrase = $passphrase;
        parent::__construct('siap:generate:jwt-keys');
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $pubKeyPath = $this->pubKeyPath;
        $secKeyPath = $this->secKeyPath;
        $passphrase = $this->passphrase;

        if (!is_dir($dir = \dirname($pubKeyPath))) {
            $output->writeln('Creating directories in '.$pubKeyPath);
            mkdir($dir, 0777, true);
        }

        $output->writeln(sprintf('Generating private key in <info>%s</info>', $secKeyPath));
        $process = new Process([
            'openssl', 'genrsa', '-out', $secKeyPath, '-aes256', '-passout', 'pass:'.$passphrase, '4096',
        ]);
        $process->run(function ($type, $buffer) use ($output) {
            $output->write(sprintf('<info>%s</info>', $buffer));
        });

        $output->writeln(sprintf('Generating public key in <info>%s</info>', $pubKeyPath));
        $process = new Process([
            'openssl',
            'rsa',
            '-pubout',
            '-in',
            $secKeyPath,
            '-passin',
            'pass:'.$passphrase,
            '-out', $pubKeyPath,
        ]);

        $process->run(function ($type, $buffer) use ($output) {
            $output->write(sprintf('<info>%s</info>', $buffer));
        });
    }
}
