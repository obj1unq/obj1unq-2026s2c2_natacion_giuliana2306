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
    method sueldoDe(_curso) {
        return 20 + (_curso.recaudacionBruta() *self.porcentaje())
    }
    method porcentaje() {
        return 0.1
    }
}

class Dedicado inherits DocenteBasico {
    var estilo

    override method estaHabilitadoADarClasesA(_estudiante) {
        return _estudiante.domina(estilo)
    }
    override method porcentaje() {
        return 0.15
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
    override method sueldoDe(_curso) {
        return super(_curso) + 3 * limiteDeCupo
    }
}