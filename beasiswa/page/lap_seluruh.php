<div class="row">
	<div class="col-md-12">
	    <div class="panel panel-info">
	        <div class="panel-heading"><h3 class="text-center">Laporan Nilai Seluruh Siswa</h3></div>
	        <div class="panel-body">
				<form class="form-inline" action="<?=$_SERVER["REQUEST_URI"]?>" method="post">
					<label for="tahun">Tahun :</label>
					<select class="form-control" name="tahun">
						<option>---</option>
					<?php
						$q = $connection->query("SELECT tahun_mengajukan AS tahun FROM siswa GROUP BY tahun_mengajukan");
						while ($row = $q->fetch_assoc()) {
					?>
						<option value="<?php echo $row['tahun']; ?>"><?php echo $row['tahun']; ?></option>					
					<?php
						}
					?>
					</select>
					<button type="submit" class="btn btn-primary">Tampilkan</button>
				</form>
	            <?php if ($_SERVER["REQUEST_METHOD"] == "POST"): ?>
				<?php
				$q = $connection->query("SELECT b.kd_beasiswa, b.nama, h.nilai, m.nama AS siswa, m.nis, (SELECT MAX(nilai) FROM hasil WHERE nis=h.nis) AS nilai_max FROM siswa m JOIN hasil h ON m.nis=h.nis JOIN beasiswa b ON b.kd_beasiswa=h.kd_beasiswa WHERE m.tahun_mengajukan='$_POST[tahun]'");
				$beasiswa = []; $data = []; $d = [];
				while ($r = $q->fetch_assoc()) {
					$beasiswa[$r["kd_beasiswa"]] = $r["nama"];
					$s = $connection->query("SELECT b.nama, a.nilai FROM hasil a JOIN beasiswa b USING(kd_beasiswa) WHERE a.nis=$r[nis] AND a.tahun=$_POST[tahun]");
					while ($rr = $s->fetch_assoc()){
						$d[$rr['nama']] = $rr['nilai'];
					}
					$m = max($d);
					$k = array_search($m, $d);
					$data[$r["nis"]."-".$r["siswa"]."-".$r["nilai_max"]."-".$k][$r["kd_beasiswa"]] = $r["nilai"];
				}
				?>
				<hr>
				<table class="table table-condensed">
	                <thead>
	                    <tr>
							<th>NIS</th>
							<th>Nama</th>
							<?php foreach ($beasiswa as $val): ?>
		                        <th><?=$val?></th>
							<?php endforeach; ?>
							<th>Nilai Maksimal</th>
							<th>Rekomendasi</th>
	                    </tr>
	                </thead>
					<tbody>
					<?php foreach($data as $key => $val): ?>
						<tr>
							<?php $x = explode("-", $key); ?>
							<td><?=$x[0]?></td>
							<td><?=$x[1]?></td>
							<?php foreach ($val as $v): ?>
								<td><?=number_format($v, 8)?></td>
							<?php endforeach; ?>
							<td><?=number_format($x[2], 8)?></td>
							<td><?=$x[3]?></td>
						</tr>
					<?php endforeach ?>
					</tbody>
		            </table>
	            <?php endif; ?>
	        </div>
	    </div>
	</div>
</div>
