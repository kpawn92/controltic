<?= $this->extend("template/menu"); ?>

<?= $this->section("title"); ?>
UPS
<?= $this->endSection(); ?>

<?= $this->section("css"); ?>
<?= $this->include('template/tableStyle') ?>
<?= $this->include('template/formStyle') ?>
<?= $this->endSection(); ?>

<?= $this->section("menu"); ?>
open
<?= $this->endSection(); ?>


<?= $this->section("c14"); ?>
active
<?= $this->endSection(); ?>

<?= $this->section("pc"); ?>
active
<?= $this->endSection(); ?>

<?= $this->section("home"); ?>
<!-- Preloader -->
<div class="preloader flex-column justify-content-center align-items-center">
    <h1 class="modal-title" id="exampleModalLabel">Monitor</h1>
    <div class="spinner-border" role="status">
        <span class="sr-only">Loading...</span>
    </div>
</div>
<?= $this->endSection(); ?>


<?= $this->section("content"); ?>
<!-- Modal Eliminar MONITOR-->
<div class="modal fade validate" id="delmonitor" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="POST" action="<?= site_url("/del_monitor") ?>">
                    <div class="form-group">
                        <div class="card card-default">
                            <div class="card-header">
                                <h3 class="card-title">
                                    <i class="fas fa-bullhorn"></i>
                                    Alert!
                                </h3>
                            </div>

                            <div class="cardy-body">
                                <div class="callout callout-danger">
                                    <h5>El registro sera elminado!</h5>

                                    <p>Se borraran todos los datos sin recuperacion, para proceder darle en Aceptar.</p>
                                </div>
                            </div>

                            <input type="text" name="id" id="idmodal" value="">

                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary" name="btn-modal">Aceptar</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal Actualizar  fecha de reparacion-->
<div class="modal fade validate" id="upmonitor" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Fecha de soluci&oacute;n</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="POST" action="<?= site_url("/up_monitor") ?>">
                    <div class="form-group">
                        <input type="hidden" name="id" id="idmodal2">
                        <label for="fecha">Fecha:</label>
                        <div class="input-group date" id="reservationdatetime4" data-target-input="nearest">
                            <input type="datetime" class="form-control datetimepicker-input" data-target="#reservationdatetime4" name="date_status" required />
                            <div class="input-group-append" data-target="#reservationdatetime4" data-toggle="datetimepicker">
                                <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                            </div>
                        </div>
                        <label>Estado T&eacute;nico:</label>
                        <select class="form-control select2" style="width: 100%;" id="estado" name="estado">
                            <option value="1">Bueno</option>
                            <option value="2">Malo</option>
                            <option value="3">Regular</option>
                        </select>

                        <label>Estado inventario:</label>
                        <select class="form-control select2" style="width: 100%;" id="inventario" name="inventario">
                            <option value="1">Activo</option>
                            <option value="2">No activo</option>
                            <option value="3">Baja t&eacute;nica</option>
                        </select>
                    </div>
                    <div class="card card-default">
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                            <button type="submit" class="btn btn-primary" name="btn-modal">Guardar</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Entrada de los monitores</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item">Monitores</li>
                        <li class="breadcrumb-item"><a style="color: dimgray;" href="<?= base_url("/dash") ?>">Home</a></li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <?php if (session('alert')) : ?>
        <div class="row">
            <div class="col-6">
                <div class="col-md-12">
                    <div class="alert alert-warning">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        <strong><i class="fas fa-info-circle mr-1"></i> <?= session('alert') ?></strong>
                    </div>
                </div>
            </div>
        </div>
    <?php endif ?>
    <?php if (session('success')) : ?>
        <div class="row">
            <div class="col-6">
                <div class="col-md-12">
                    <div class="alert alert-success">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        <strong><i class="fas fa-info-circle mr-1"></i> <?= session('success') ?></strong>
                    </div>
                </div>
            </div>
        </div>
    <?php endif ?>

    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <!-- left column -->
                <div class="col-md-12">
                    <!-- general form elements -->
                    <div class="card card-success">
                        <div class="card-header">
                            <h3 class="card-title">Formulario para el registro de los monitores</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form method="POST" action="<?= site_url("/reg_monitor") ?>" id="quickForm">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label>Seleccione la pc:</label>
                                            <select class="form-control select2" style="width: 100%;" id="fk_pc" name="fk_pc">
                                                <?php foreach ($cpus as $cpu) : ?>
                                                    <option value="<?= $cpu['id'] ?>"><?= $cpu['nombrepc']." - ".$cpu['inventario'] ?></option>
                                                <?php endforeach; ?>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Tipo:</label>
                                            <select class="form-control select2" style="width: 100%;" id="tipo" name="tipo">
                                                <option value="1">LCD</option>
                                                <option value="2">CRT</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="pulgadas">Tamaño (Pulgadas):</label>
                                            <input type="text" class="form-control" id="pulgadas" name="pulgadas">
                                        </div>
                                        <div class="form-group">
                                            <label for="inventario">Inventario:</label>
                                            <input type="text" class="form-control" id="inventario" name="inventario" placeholder="Entre el inventario">
                                        </div>
                                        <div class="form-group">
                                            <label for="marca">Marca:</label>
                                            <input type="text" class="form-control" id="marca" name="marca" placeholder="Entre la marca">
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label for="modelo">Modelo:</label>
                                            <input type="text" class="form-control" id="modelo" name="modelo" placeholder="Entre el modelo">
                                        </div>
                                        <div class="form-group">
                                            <label for="ns">N&uacute;mero de serie:</label>
                                            <input type="text" class="form-control" id="ns" name="ns" placeholder="Entre el numero de serie">
                                        </div>
                                        <div class="form-group">
                                            <label>Estado T&eacute;nico:</label>
                                            <select class="form-control select2" style="width: 100%;" id="status" name="status">
                                                <option value="1">Bueno</option>
                                                <option value="2">Malo</option>
                                                <option value="3">Regular</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Estado de inventario:</label>
                                            <select class="form-control select2" style="width: 100%;" id="status_inventario" name="status_inventario">
                                                <option value="1">Activo</option>
                                                <option value="2">No activo</option>
                                                <option value="3">Baja t&eacute;nica</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Fecha de inicio de explotaci&oacute;n:</label>
                                            <div class="input-group date" id="reservationdatetime" data-target-input="nearest">
                                                <input type="text" class="form-control datetimepicker-input" data-target="#reservationdatetime" name="date" placeholder="mm/dd/YYYY" />
                                                <div class="input-group-append" data-target="#reservationdatetime" data-toggle="datetimepicker">
                                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <button type="submit" name="btn-monitor" class="btn btn-success">Guardar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="mb-4">
        <!-- Solid divider -->
        <hr class="solid">
    </div>


    <div class="row">
        <div class="col-12">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">

                        <div class="row">
                            <span>Listado de teclados registrados</span>
                        </div>

                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">

                        <?php $i = 1; ?>
                        <table id="monitores" class="table table-hover text-nowrap">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Acci&oacute;n</th>
                                    <th>CPU</th>
                                    <th>Tipo</th>
                                    <th>Tamaño (Pulgadas)</th>
                                    <th>Inventario</th>
                                    <th>Marca</th>
                                    <th>Modelo</th>
                                    <th>N&uacute;mero de serie</th>
                                    <th>Estado T&eacute;cnico</th>
                                    <th>Estado de inventario</th>
                                    <th>Fecha de inicio</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($monitores as $monitor) : ?>
                                    <tr>
                                        <th><?= $i++ ?></th>
                                        <td class="action">
                                            <button type="button" data-toggle="modal" data-target="#delmonitor" data-id="<?= $monitor['id'] ?>" class="btn btn-danger btn-single btn-sm fa-input"><i class="fas fa-trash-alt"></i></button>
                                            <button type="button" data-toggle="modal" data-target="#upmonitor" data-id="<?= $monitor['id'] ?>" class="btn btn-info btn-single btn-sm fa-input"><i class="fas fa-edit"></i></button>
                                            
                                        </td>
                                        <td><?= $monitor['nombrepc'] . " - " . $monitor['inventario'] ?></td>
                                        <td>
                                            <?php
                                            $tipo = $monitor['tipo'];
                                            if ($tipo == 1) {
                                                echo "LCD";
                                            } else if ($tipo == 2) {
                                                echo "CRT";
                                            }
                                            ?>
                                        </td>
                                        <td><?= $monitor['pulgadas'] ?></td>
                                        <td><?= $monitor['inv'] ?></td>
                                        <td><?= $monitor['marca'] ?></td>
                                        <td><?= $monitor['modelo'] ?></td>
                                        <td><?= $monitor['ns'] ?></td>
                                        <td>
                                            <?php
                                            $estado = $monitor['status'];
                                            if ($estado == 1) {
                                                echo "Bueno";
                                            } else if ($estado == 2) {
                                                echo "Malo";
                                            } else if ($estado == 3) {
                                                echo "Regular";
                                            }
                                            ?>
                                        </td>
                                        <td>
                                            <?php
                                            $estado = $monitor['status_inventario'];
                                            if ($estado == 1) {
                                                echo "Activo";
                                            } else if ($estado == 2) {
                                                echo "No activo";
                                            } else if ($estado == 3) {
                                                echo "Baja t&eacute;cnica";
                                            }
                                            ?>
                                        </td>
                                        <td><?= $monitor['fecha'] ?></td>

                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.card-body -->
                </div>
            </div>
        </div>
    </div>
</div>
<?= $this->endSection(); ?>

<?= $this->section("js"); ?>
<?= $this->include('template/tableScript') ?>
<script>
    $(document).ready(function() {

        $('#delmonitor').on('show.bs.modal', function(e) {
            var id = $(e.relatedTarget).data('id');
            $("#idmodal").val(id);
        });

        $('#upmonitor').on('show.bs.modal', function(e) {
            var id = $(e.relatedTarget).data('id');
            $("#idmodal2").val(id);
        });


        $("#monitores").DataTable({
            "language": espanol,
            "responsive": true,
            "lengthChange": false,
            "autoWidth": false,
            "buttons": ["copy", "excel", "print", "colvis"]
        }).buttons().container().appendTo('#monitores_wrapper .col-md-6:eq(0)');

    });
    let espanol = {
        <?= $this->include('template/langJquery') ?>,
    };
</script>
<?= $this->endSection(); ?>