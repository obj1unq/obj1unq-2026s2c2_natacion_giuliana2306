import docentes.*
import estudiantes.*

class CursoBase {
    var estudiantesInscriptos = #{}
    var docente
    var cupoMaximo

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
}

class EscuelitaDeNiños inherits CursoBase {
    override method cumpleRequisitosAdicionales(_estudiante) {
        return super(_estudiante) && _estudiante.esMenorDe13Años()
    }
}

class Terapeutico inherits CursoBase {
    override method cumpleRequisitosAdicionales(_estudiante) {
        return _estudiante.dominaAlMenosUnEstiloRelajante()
    }
}