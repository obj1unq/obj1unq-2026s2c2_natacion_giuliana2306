class CursoBase {
    var estudiantesInscriptos = #{}
    var docente
    var cupoMaximo
    var valorDeInscripcionBase = 20

    method estudiantesInscriptos() {
        return estudiantesInscriptos
    }
    method puedeInscribirse(_estudiante) {
        return(!self.estaInscripto(_estudiante))               && 
                self.tieneVacantesDisponibles()                &&
                docente.estaHabilitadoADarClasesA(_estudiante) &&
                self.cumpleRequisitosAdicionales(_estudiante)
    }
    method estaInscripto(_estudiante) {
        return estudiantesInscriptos.contains(_estudiante)
    }
    method tieneVacantesDisponibles() {
        return self.cantidadDeInscriptos() < cupoMaximo
    }
    method cantidadDeInscriptos() {
        return estudiantesInscriptos.size()
    }
    method cumpleRequisitosAdicionales(_estudiante) {
        return _estudiante.dominaAlMenosUnEstilo() ||
               docente.poseeTituloDeGuardavidas()
    }
    method inscribirA(_estudiante) {
        self.validarInscribirA(_estudiante)
        estudiantesInscriptos.add(_estudiante)
        cupoMaximo = cupoMaximo - 1
        docente.disminuirCupo()
    }
    method validarInscribirA(_estudiante) {
        if(!self.puedeInscribirse(_estudiante)) {
            self.error("No puede inscribirse el estudiante")
        }
    }
    method recaudacion() {
        return self.recaudacionBruta() - docente.sueldoDe(self)
    }
    method recaudacionBruta() {
        return self.recaudacionBrutaTotal() - self.descuentosPorInscriptos()
    }
    method recaudacionBrutaTotal() {
        return valorDeInscripcionBase  * self.cantidadDeInscriptos()
    }
    method descuentosPorInscriptos() {
        return estudiantesInscriptos.sum({estudiante => estudiante.totalDeDescuentos()})
    }
    method algunEstudianteDominaEstilo(_estilo) {
        return estudiantesInscriptos.any({estudiante => estudiante.domina(_estilo)})
    }
    method esCursoInfantil() {
        return estudiantesInscriptos.all({estudiante => estudiante.esMenorDe13Años()})
    }
    method docente() {
        return docente
    }
}

class EscuelitaDeNiños inherits CursoBase {
    override method cumpleRequisitosAdicionales(_estudiante) {
        return super(_estudiante) && _estudiante.esMenorDe13Años()
    }
    override method recaudacionBruta() {
        return super() + 500
    }
}

class Terapeutico inherits CursoBase {
    var property recaudacionBruta
    
    override method cumpleRequisitosAdicionales(_estudiante) {
        return _estudiante.dominaAlMenosUnEstiloRelajante()
    }
}