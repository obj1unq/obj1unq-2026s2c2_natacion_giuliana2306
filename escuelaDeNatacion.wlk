class EscuelaDeNatacion {
    var recaudacionTotal
    var cursos = #{}

    method recaudacionTotal() {
        return recaudacionTotal
    }
    method cobrarRecaudacion() {
        recaudacionTotal = recaudacionTotal + self.recaudacionDeCursos()
    }
    method recaudacionDeCursos() {
        return cursos.sum({curso => curso.recaudacion()})
    }
    method cursoQueDomina(_estilo) {
        return cursos.find({curso => curso.algunEstudianteDominaEstilo(_estilo)})
    }
    method cursosInfantiles() {
        return cursos.filter({curso => curso.esCursoInfantil()})
    }
    method docentesInfantiles() {
        return self.cursosInfantiles().map({curso => curso.docente()})
    }
}