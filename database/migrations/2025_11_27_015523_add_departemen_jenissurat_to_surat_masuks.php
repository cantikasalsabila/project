// database/migrations/xxxx_add_departemen_jenissurat_to_surat_masuks.php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::table('surat_masuks', function (Blueprint $table) {
            $table->string('departemen')->after('perihal');
            $table->string('jenis_surat')->after('departemen');
        });
    }

    public function down()
    {
        Schema::table('surat_masuks', function (Blueprint $table) {
            $table->dropColumn(['departemen', 'jenis_surat']);
        });
    }
};