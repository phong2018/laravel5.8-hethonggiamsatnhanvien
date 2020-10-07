<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

use Symfony\Component\Process\Process;
use Symfony\Component\Process\Exception\ProcessFailedException;


use Illuminate\Http\Request;
use Ifsnop\Mysqldump as IMysqldump;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Str;
use App\Backup;
use App\Setting; 



class BackupDatabase extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'db:backup';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description ='Backup the database';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct(); 

        
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
     
        try {
            Setting::taofilebackup();
            
            return redirect('admin/backup')->with('messenger', 'Backup thành công.');

        } catch (\Exception $e) {
            //echo 'mysqldump-php error: ' . $e->getMessage();
            return redirect('admin/backup')->with('messenger','mysqldump-php error: ' . $e->getMessage());
        }

        
        
         
    }
}
