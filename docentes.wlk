
import estudiantes.*
class DocenteBasico {
    var esGuardavidas

    method estaHabilitadoADarClasesA(_estudiante) {
        return true
    }
    method poseeTituloDeGuardavidas() {
        return esGuardavidas
    }
    method disminuirCupo() {
        
    }
}

class Dedicado inherits DocenteBasico {
    var estilo

    override method estaHabilitadoADarClasesA(_estudiante) {
        return _estudiante.domina(estilo)
    }
}

class Externo inherits DocenteBasico {
    var limiteDeCupo 

    override method estaHabilitadoADarClasesA(_estudiante) {
        if(_estudiante.esMenorDe13Años() ) {
            return self.hayCupo()
        } else {
            return true
        }
    }
    method hayCupo() {
        return limiteDeCupo > 0
    }
    override method disminuirCupo() {
        limiteDeCupo = limiteDeCupo - 1
    }
}