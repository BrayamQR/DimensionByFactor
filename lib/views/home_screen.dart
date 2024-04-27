import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ge_factor1/models/criterio.dart';
import 'package:ge_factor1/models/factor.dart';
import 'package:ge_factor1/models/standard.dart';
import 'package:ge_factor1/views/response_screen.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Factor> lstFactor = [];
  final List<Standard> lstStandard = [];
  final List<Criterio> lstCriterio = [];
  Factor? selectedFactor;
  Standard? selectedStandard;
  int factor = 1;

  @override
  void initState() {
    super.initState();
    //Listado de factores
    AddFactor(factor);
    //Listado de estandares por factor
    AddStandard();
    //Listado de criterios por estandar
    AddCriterio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECEAF4),
      appBar: AppBar(
        title: Text(
          AddTitleNav(factor),
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Center(
                  child: Text(
                    AddTitleBody(factor),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          Center(
            child: Lottie.asset(
              'assets/animations/questionnaire.json', // Ruta de tu archivo de animación Lottie
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: _FormQuestionnaire(
                  lstFactor: lstFactor,
                  lstStandard: lstStandard,
                  lstCriterio: lstCriterio,
                  onFactorChanged: (Factor? factor) {
                    setState(() {
                      selectedFactor = factor;
                      selectedStandard = null;
                    });
                  },
                  onStandardChange: (Standard? standard) {
                    setState(() {
                      selectedStandard = standard;
                    });
                  },
                  selectedFactor: selectedFactor,
                  selectedStandard: selectedStandard,
                  onCriterioChanged: (criterio, value) {
                    setState(() {
                      criterio.ischecked = value;
                    });
                  },
                  factor: factor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void AddFactor(int factor) {
    if (factor == 1) {
      lstFactor.add(Factor(
        id: 1,
        factor: "Factor 01",
        name: "Planificación del programa de estudios",
      ));
    } else if (factor == 2) {
      lstFactor.add(Factor(
        id: 2,
        factor: "Factor 02",
        name: "Gestión del perfil de egreso",
      ));
    } else if (factor == 3) {
      lstFactor.add(Factor(
        id: 3,
        factor: "Factor 03",
        name: "Aseguramiento de la calidad",
      ));
    } else if (factor == 4) {
      lstFactor.add(Factor(
        id: 4,
        factor: "Factor 04",
        name: "Proceso enseñanza-aprendizaje",
      ));
    } else if (factor == 5) {
      lstFactor.add(Factor(
        id: 5,
        factor: "Factor 05",
        name: "Gestión de los docentes",
      ));
    } else if (factor == 6) {
      lstFactor.add(Factor(
        id: 6,
        factor: "Factor 06",
        name: "Seguimiento a estudiantes",
      ));
    } else if (factor == 7) {
      lstFactor.add(Factor(
        id: 7,
        factor: "Factor 07",
        name: "Investigación, desarrollo tecnológico e innovación",
      ));
    } else if (factor == 8) {
      lstFactor.add(Factor(
        id: 8,
        factor: "Factor 08",
        name: "Responsabilidad social universitaria",
      ));
    } else if (factor == 9) {
      lstFactor.add(Factor(
        id: 9,
        factor: "Factor 09",
        name: "Servicios de bienestar",
      ));
    } else if (factor == 10) {
      lstFactor.add(Factor(
        id: 10,
        factor: "Factor 10",
        name: "Infraestructura y soporte",
      ));
    } else if (factor == 11) {
      lstFactor.add(Factor(
        id: 11,
        factor: "Factor 11",
        name: "Recursos humanos",
      ));
    } else if (factor == 12) {
      lstFactor.add(Factor(
        id: 12,
        factor: "Factor 12",
        name: "Verificación del perfil de egreso",
      ));
    }
  }

  void AddStandard() {
    //Factor 01
    lstStandard.add(Standard(
      id: 1,
      standard: "Estándar 01",
      name: "Propósitos articulados",
      idfactor: 1,
    ));
    lstStandard.add(Standard(
      id: 2,
      standard: "Estándar 02",
      name: "Participación de los grupos de interés",
      idfactor: 1,
    ));
    lstStandard.add(Standard(
      id: 3,
      standard: "Estándar 03",
      name: "Revisión periódica y participativa de las políticas y objetivos",
      idfactor: 1,
    ));
    lstStandard.add(Standard(
      id: 4,
      standard: "Estándar 04",
      name: "Sostenibilidad",
      idfactor: 1,
    ));

    //Factor 02
    lstStandard.add(Standard(
      id: 5,
      standard: "Estándar 05",
      name: "Pertinencia del perfil de egreso",
      idfactor: 2,
    ));
    lstStandard.add(Standard(
      id: 6,
      standard: "Estándar 06",
      name: "Revisión del perfil de egreso",
      idfactor: 2,
    ));

    //Factor 03
    lstStandard.add(Standard(
      id: 7,
      standard: "Estándar 07",
      name: "Sistema de gestión de la calidad",
      idfactor: 3,
    ));
    lstStandard.add(Standard(
      id: 8,
      standard: "Estándar 08",
      name: "Planes de mejora",
      idfactor: 3,
    ));

    //Factor 04
    lstStandard.add(Standard(
      id: 9,
      standard: "Estándar 09",
      name: "Plan de estudios",
      idfactor: 4,
    ));
    lstStandard.add(Standard(
      id: 10,
      standard: "Estándar 10",
      name: "Características del plan de estudios",
      idfactor: 4,
    ));
    lstStandard.add(Standard(
      id: 11,
      standard: "Estándar 11",
      name: "Enfoque por competencias",
      idfactor: 4,
    ));
    lstStandard.add(Standard(
      id: 12,
      standard: "Estándar 12",
      name: "Articulación con I+D+i y responsabilidad social",
      idfactor: 4,
    ));
    lstStandard.add(Standard(
      id: 13,
      standard: "Estándar 13",
      name: "Movilidad",
      idfactor: 4,
    ));

    //Factor 05
    lstStandard.add(Standard(
      id: 14,
      standard: "Estándar 14",
      name: "Selección, evaluación, capacitación y perfeccionamiento",
      idfactor: 5,
    ));
    lstStandard.add(Standard(
      id: 15,
      standard: "Estándar 15",
      name: "Plana docente adecuada",
      idfactor: 5,
    ));
    lstStandard.add(Standard(
      id: 16,
      standard: "Estándar 16",
      name: "Reconocimiento de las actividades de labor docente",
      idfactor: 5,
    ));
    lstStandard.add(Standard(
      id: 17,
      standard: "Estándar 17",
      name: "Plan de desarrollo académico del docente",
      idfactor: 5,
    ));

    //Factor 06
    lstStandard.add(Standard(
      id: 18,
      standard: "Estándar 18",
      name: "Admisión al programa de estudios",
      idfactor: 6,
    ));
    lstStandard.add(Standard(
      id: 19,
      standard: "Estándar 19",
      name: "Nivelación de ingresantes",
      idfactor: 6,
    ));
    lstStandard.add(Standard(
      id: 20,
      standard: "Estándar 20",
      name: "Seguimiento al desempeño de los estudiantes",
      idfactor: 6,
    ));
    lstStandard.add(Standard(
      id: 21,
      standard: "Estándar 21",
      name: "Actividades extracurriculares",
      idfactor: 6,
    ));

    //Factor 07
    lstStandard.add(Standard(
      id: 22,
      standard: "Estándar 22",
      name: "Gestión y calidad de la I+D+i realizada por docentes",
      idfactor: 7,
    ));
    lstStandard.add(Standard(
      id: 23,
      standard: "Estándar 23",
      name: "I+D+i para la obtención del grado y el título",
      idfactor: 7,
    ));
    lstStandard.add(Standard(
      id: 24,
      standard: "Estándar 24",
      name: "Publicaciones de los resultados de I+D+i",
      idfactor: 7,
    ));

    //Factor 08
    lstStandard.add(Standard(
      id: 25,
      standard: "Estándar 25",
      name: "Responsabilidad social",
      idfactor: 8,
    ));
    lstStandard.add(Standard(
      id: 26,
      standard: "Estándar 26",
      name: "Implementación de políticas ambientales",
      idfactor: 8,
    ));
    //Factor 09
    lstStandard.add(Standard(
      id: 27,
      standard: "Estándar 27",
      name: "Bienestar",
      idfactor: 9,
    ));

    //Factor 10
    lstStandard.add(Standard(
      id: 28,
      standard: "Estándar 28",
      name: "Equipamiento y uso de la infraestructura",
      idfactor: 10,
    ));
    lstStandard.add(Standard(
      id: 29,
      standard: "Estándar 29",
      name: "Mantenimiento de la infraestructura",
      idfactor: 10,
    ));
    lstStandard.add(Standard(
      id: 30,
      standard: "Estándar 30",
      name: "Sistema de información y comunicación",
      idfactor: 10,
    ));
    lstStandard.add(Standard(
      id: 31,
      standard: "Estándar 31",
      name: "Centros de información y referencia",
      idfactor: 10,
    ));

    //Factor 11
    lstStandard.add(Standard(
      id: 32,
      standard: "Estándar 32",
      name: "Recursos humanos para la gestión del programa de estudios",
      idfactor: 11,
    ));

    //Factor 12
    lstStandard.add(Standard(
      id: 33,
      standard: "Estándar 33",
      name: "Logro de competencias",
      idfactor: 12,
    ));
    lstStandard.add(Standard(
      id: 34,
      standard: "Estándar 34",
      name: "Seguimiento a egresados y objetivos educacionales",
      idfactor: 12,
    ));
  }

  void AddCriterio() {
    // //Estandar 01
    lstCriterio.add(Criterio(
      id: 1,
      criterio:
          "El programa de estudios ha definido claramente el número y las características de los miembros de sus grupos de interés, quienes han participado y participan en procesos de consulta para la definición de los propósitos del programa de estudios.",
      idstandard: 1,
    ));
    lstCriterio.add(Criterio(
      id: 2,
      criterio:
          "Se demuestra que los propósitos del programa de estudios están alineados con los propósitos institucionales.",
      idstandard: 1,
    ));
    lstCriterio.add(Criterio(
      id: 3,
      criterio:
          "Estos propósitos están establecidos en documentos oficiales y están a disposición de toda la sociedad a través de la página web de la institución, los prospectos respectivos de los programas de estudios, entre otros documentos que la institución pudiera tener.",
      idstandard: 1,
    ));

    //Estandar 02
    lstCriterio.add(Criterio(
      id: 4,
      criterio:
          "El programa de estudios identifica la demanda social, planes de desarrollo regional, nacional o internacional para definir la oferta académica en cuanto a su pertinencia y tamaño. Para este proceso considera la opinión de los grupos de interés.",
      idstandard: 2,
    ));

    //Estandar 03
    lstCriterio.add(Criterio(
      id: 5,
      criterio:
          "Con una periodicidad definida por el programa de estudios (máximo 3 años) analiza y considera los cambios que existen en los ámbitos económico, social, político, cultural, científico y tecnológico, con el propósito de determinar la pertinencia de realizar ajustes en las políticas y objetivos que aseguren un camino hacia la excelencia.",
      idstandard: 3,
    ));
    lstCriterio.add(Criterio(
      id: 6,
      criterio:
          "Esta revisión se realiza con la participación de los grupos de interés definidos por el programa de estudios y los resultados son comunicados al público en general.",
      idstandard: 3,
    ));

    //Estandar 04
    lstCriterio.add(Criterio(
      id: 7,
      criterio:
          "Todas las actividades regulares que realiza el programa de estudios, así como los proyectos especiales, deben estar financiados en un horizonte temporal que asegure su continuidad.",
      idstandard: 4,
    ));
    lstCriterio.add(Criterio(
      id: 8,
      criterio:
          "Deben existir evidencias de que la gestión de los recursos se realiza de una manera eficiente, ya sea por indicadores financieros, reportes de auditorías, indicadores de gestión, evaluación del plan operativo, informes de evaluación de cumplimiento de objetivos, metas y gestión adecuada de recursos.",
      idstandard: 4,
    ));
    lstCriterio.add(Criterio(
      id: 9,
      criterio:
          "Deben existir evidencias de que la gestión en investigación, desarrollo tecnológico e innovación (I+D+i) se realiza de una manera eficiente, ya sea por indicadores de ciencia, tecnología e innovación tecnológica (CTel), tesis defendidas, proyectos de investigación financiados por agentes internos o externos a la institución, informe de equipamientos de los laboratorios de investigación.",
      idstandard: 4,
    ));
    lstCriterio.add(Criterio(
      id: 10,
      criterio:
          "Esta revisión se realiza con la participación de los grupos de interés definidos por el programa de estudios y los resultados son comunicados al público en general.",
      idstandard: 4,
    ));

    //Estandar 05
    lstCriterio.add(Criterio(
      id: 11,
      criterio:
          "El perfil de egreso debe incluir las competencias generales y específicas que se espera que los estudiantes logren durante su formación y sean verificables como condición para el egreso.",
      idstandard: 5,
    ));
    lstCriterio.add(Criterio(
      id: 12,
      criterio:
          "En la fundamentación y detalle del perfil de egreso se debe evidenciar su alineación con los propósitos del programa de estudios, el currículo, las expectativas de los grupos de interés y el entorno socioeconómico.",
      idstandard: 5,
    ));
    lstCriterio.add(Criterio(
      id: 13,
      criterio:
          "Esta revisión se realiza con la participación de los grupos de interés definidos por el programa de estudios y los resultados son comunicados al público en general.",
      idstandard: 5,
    ));

    //Estandar 06
    lstCriterio.add(Criterio(
      id: 14,
      criterio:
          "El programa de estudios identifica la periodicidad de revisión del perfil de egreso. La revisión deberá efectuarse en un período máximo de tres años",
      idstandard: 6,
    ));
    lstCriterio.add(Criterio(
      id: 15,
      criterio:
          "Esta revisión será conducida por los directivos del programa de estudios, con la participación de los grupos de interés y otros actores que el programa de estudios considere idóneos.",
      idstandard: 6,
    ));
    lstCriterio.add(Criterio(
      id: 16,
      criterio:
          "La revisión del perfil considera el desempeño profesional, avances científicos y tecnológicos, nuevas demandas de la comunidad académica y el entorno, entre otros. De ser el caso, esta revisión termina con la definición del nuevo perfil de egreso.",
      idstandard: 6,
    ));
    lstCriterio.add(Criterio(
      id: 17,
      criterio:
          "Cualquier modificación en el perfil de egreso estará acompañada de los cambios necesarios en los mecanismos que tiene el programa de estudios para lograr las competencias definidas para los estudiantes y egresados.",
      idstandard: 6,
    ));

    //Estandar 07
    lstCriterio.add(Criterio(
      id: 18,
      criterio:
          "La implementación del SGC está enmarcada en la definición de políticas, objetivos, procesos y procedimientos para lograrlo. Además, debe considerar mecanismos que brinden confianza y que controlen los procesos para la mejora continua.",
      idstandard: 7,
    ));
    lstCriterio.add(Criterio(
      id: 19,
      criterio:
          "El programa de estudios debe demostrar evidencia del funcionamiento del SGC en sus procesos principales y de las acciones para su evaluación y mejora (auditorías internas).",
      idstandard: 7,
    ));

    //Estandar 08
    lstCriterio.add(Criterio(
      id: 20,
      criterio:
          "El programa de estudios desarrolla un proceso participativo (se contempla la contribución que los grupos de interés, representantes de docentes, estudiantes, administrativos y directivos pudieran hacer al respecto) para la identificación de oportunidades de mejora a fin de alcanzar la excelencia académica.",
      idstandard: 8,
    ));
    lstCriterio.add(Criterio(
      id: 21,
      criterio:
          "Se definen, implementan y monitorean planes de mejora en función de un criterio de priorización para la ejecución.",
      idstandard: 8,
    ));
    lstCriterio.add(Criterio(
      id: 22,
      criterio:
          "El programa de estudios debe evaluar el cumplimiento de los planes de mejora y demostrar avances periódicos (de acuerdo con las metas que se hayan fijado deberán poder observarse avances al menos semestralmente) en su implementación.",
      idstandard: 8,
    ));

    //Estanar 09
    lstCriterio.add(Criterio(
      id: 23,
      criterio:
          "El plan de estudios incluye, entre otros componentes, los perfiles de ingreso y egreso, los objetivos educacionales, la malla curricular, los criterios y estrategias de enseñanza-aprendizaje, de evaluación y titulación. ",
      idstandard: 9,
    ));
    lstCriterio.add(Criterio(
      id: 24,
      criterio:
          "El programa de estudios tiene definidas las competencias que debe tener un estudiante cuando ingresa y egresa.",
      idstandard: 9,
    ));
    lstCriterio.add(Criterio(
      id: 25,
      criterio:
          "El perfil de egreso define las estrategias de enseñanza-aprendizaje, de evaluación del logro de competencias y criterios para la obtención del grado y titulación. Asimismo, orienta el logro de los objetivos educacionales.",
      idstandard: 9,
    ));
    lstCriterio.add(Criterio(
      id: 26,
      criterio:
          "El programa de estudios asegura su pertinencia interna revisando periódica y participativamente el plan de estudios.",
      idstandard: 9,
    ));
    lstCriterio.add(Criterio(
      id: 27,
      criterio:
          "La revisión deberá efectuarse en un período máximo de tres años, como se sugiere en la nueva Ley Universitaria.",
      idstandard: 9,
    ));

    //Estandar 10
    lstCriterio.add(Criterio(
      id: 28,
      criterio:
          "El programa de estudios distribuye los cursos del plan de estudios indicando el número de créditos, horas dedicadas a teoría, práctica y enseñanza virtual. En cuanto al tipo curso, si es general, específico o de especialidad. Respecto del componente, si alude a I+D+i, formación ciudadana, responsabilidad social y experiencia preprofesional.",
      idstandard: 10,
    ));

    //Estandar 11
    lstCriterio.add(Criterio(
      id: 29,
      criterio:
          "El programa de estudios debe implementar un sistema de evaluación del aprendizaje que monitoree el logro de las competencias a lo largo de la formación.",
      idstandard: 11,
    ));
    lstCriterio.add(Criterio(
      id: 30,
      criterio:
          "El plan de estudios, tareas académicas y actividades en general aseguran el logro de las competencias.",
      idstandard: 11,
    ));

    //Estandar 12
    lstCriterio.add(Criterio(
      id: 31,
      criterio:
          "El proceso de enseñanza-aprendizaje incluye actividades de I+D+i y de responsabilidad social relacionadas con la naturaleza del programa de estudios.",
      idstandard: 12,
    ));
    lstCriterio.add(Criterio(
      id: 32,
      criterio:
          "El programa de estudios asegura la participación de estudiantes y docentes en actividades de I+D+i y responsabilidad social y muestra los resultados.",
      idstandard: 12,
    ));

    //Estandar 13
    lstCriterio.add(Criterio(
      id: 33,
      criterio:
          "La movilidad de los estudiantes debe contribuir al logro de las competencias establecidas en el perfil de egreso.",
      idstandard: 13,
    ));
    lstCriterio.add(Criterio(
      id: 34,
      criterio:
          "La movilidad de los docentes debe contribuir al fortalecimiento de sus capacidades para el desarrollo de actividades de enseñanza-aprendizaje.",
      idstandard: 13,
    ));

    //Estandar 14
    lstCriterio.add(Criterio(
      id: 35,
      criterio:
          "La normatividad para la gestión de la selección, evaluación, capacitación y perfeccionamiento del personal docente es de pleno conocimiento de todos los académicos.",
      idstandard: 14,
    ));
    lstCriterio.add(Criterio(
      id: 36,
      criterio:
          "El programa de estudios tiene mecanismos que evalúan el desempeño docente con la finalidad de identificar necesidades de capacitación y perfeccionamiento o separación. El perfeccionamiento incluye actualización, innovación pedagógica, manejo de tecnologías de información y comunicación, entre otros campos. El programa de estudios evalúa el grado de satisfacción de los docentes con los programas de capacitación y perfeccionamiento.",
      idstandard: 14,
    ));
    lstCriterio.add(Criterio(
      id: 37,
      criterio:
          "El programa de estudios debe tener mecanismos de selección transparentes, de convocatoria pública debidamente difundida, que aseguren la diversidad formativa, así como la idoneidad de los docentes.",
      idstandard: 14,
    ));
    lstCriterio.add(Criterio(
      id: 38,
      criterio:
          "Si el programa de estudios contempla un porcentaje de virtualización, el programa de capacitación y perfeccionamiento deberá contemplar estrategias y herramientas de aprendizaje para este tipo de enseñanza, sobre todo para los docentes involucrados en los cursos virtuales.",
      idstandard: 14,
    ));

    //Estandar 15
    lstCriterio.add(Criterio(
      id: 39,
      criterio:
          "El programa de estudios debe cumplir con la normatividad vigente en lo concerniente a la plana docente.",
      idstandard: 15,
    ));
    lstCriterio.add(Criterio(
      id: 40,
      criterio:
          "Los docentes cuentan con los grados académicos exigidos por el programa de estudios superiores, así como con las calificaciones tanto profesionales como didácticas y personales que aseguran el logro del perfil de egreso.",
      idstandard: 15,
    ));
    lstCriterio.add(Criterio(
      id: 41,
      criterio:
          "El programa de estudios registra, por docente: 4 cursos que imparte, grado académico, título profesional, línea de investigación, experiencia docente, con indicación de la misma en los cursos que se le asignan y experiencia profesional adicional.",
      idstandard: 15,
    ));

    //Estandar 16
    lstCriterio.add(Criterio(
      id: 42,
      criterio:
          "Dicho reconocimiento se podrá otorgar a través de diferentes formas. El programa de estudios debe mantener un registro de las diferentes formas de reconocimiento otorgados a los docentes en los últimos cinco años.",
      idstandard: 16,
    ));

    //Estandar 17
    lstCriterio.add(Criterio(
      id: 43,
      criterio:
          "El programa de estudios debe mantener lineamientos para el desarrollo científico académico de los docentes y definir un plan de desarrollo académico-profesional que debe ser monitoreado para identificar los avances y logros.",
      idstandard: 17,
    ));
    lstCriterio.add(Criterio(
      id: 44,
      criterio:
          "Asimismo, debe establecer mecanismos de motivación y reconocimiento por los logros obtenidos.",
      idstandard: 17,
    ));

    //Estandar 18
    lstCriterio.add(Criterio(
      id: 45,
      criterio:
          "El programa de estudios ha definido el perfil de ingreso, el cual complementará los mecanismos de admisión institucionales que establecen los requisitos de admisión.",
      idstandard: 18,
    ));
    lstCriterio.add(Criterio(
      id: 46,
      criterio:
          "El programa de estudios reporta la tasa de ingreso por proceso de admisión, así como el resultado de desempeño de los ingresantes en dicho proceso, en función del perfil de ingreso.",
      idstandard: 18,
    ));

    //Estanar 19
    lstCriterio.add(Criterio(
      id: 47,
      criterio:
          "El programa de estudios identifica las carencias que tienen los ingresantes a fin de diseñar, ejecutar y mantener actividades de nivelación.",
      idstandard: 19,
    ));
    lstCriterio.add(Criterio(
      id: 48,
      criterio:
          "El programa de estudios evalúa los resultados de las actividades de nivelación para establecer mejoras.",
      idstandard: 19,
    ));

    //Estanar 20
    lstCriterio.add(Criterio(
      id: 49,
      criterio:
          "El programa de estudios mantiene y ejecuta mecanismos para la identificación de problemas en el avance esperado de los estudiantes, a fin de diseñar, ejecutar y mantener actividades para superarlos. Las actividades pueden estar en el ámbito académico, científico, tecnológico y de bienestar.",
      idstandard: 20,
    ));
    lstCriterio.add(Criterio(
      id: 50,
      criterio:
          "El programa de estudios tiene un sistema de tutoría implementado y un sistema de apoyo pedagógico, que asegure la permanencia y titulación de los estudiantes, previniendo la deserción.",
      idstandard: 20,
    ));
    lstCriterio.add(Criterio(
      id: 51,
      criterio:
          "El programa de estudios evalúa los resultados de las actividades de reforzamiento y nivelación de estudiantes para asegurar el logro de las competencias.",
      idstandard: 20,
    ));

    //Estanar 21
    lstCriterio.add(Criterio(
      id: 52,
      criterio:
          "El programa de estudios identifica las actividades extracurriculares que contribuyan a la formación, mantiene un registro de dichas actividades, estadísticas de participación y nivel de satisfacción de los estudiantes. ",
      idstandard: 21,
    ));
    lstCriterio.add(Criterio(
      id: 53,
      criterio:
          "El programa de estudios evalúa los resultados de las actividades extracurriculares para establecer mejoras.",
      idstandard: 21,
    ));

    //Estandar 22
    lstCriterio.add(Criterio(
      id: 54,
      criterio:
          "El programa de estudios gestiona los recursos y alianzas estratégicas a nivel nacional e internacional que faciliten la I+D+i por parte de los docentes del programa.",
      idstandard: 22,
    ));
    lstCriterio.add(Criterio(
      id: 55,
      criterio:
          "El programa de estudios implementa lineamientos que regulan y aseguran la calidad de la I+D+i a cargo de investigadores registrados en el Registro Nacional de Investigadores en Ciencia y Tecnología (Regina).",
      idstandard: 22,
    ));
    lstCriterio.add(Criterio(
      id: 56,
      criterio:
          "Los lineamientos para I+D+i de calidad deben incluir exigencias para involucrar a estudiantes y mantener un mínimo de docentes investigadores registrados en Regina, que se incremente en el tiempo.",
      idstandard: 22,
    ));
    lstCriterio.add(Criterio(
      id: 57,
      criterio:
          "El nivel de calidad se puede determinar por estándares establecidos por el Concytec o entidades internacionales.",
      idstandard: 22,
    ));
    lstCriterio.add(Criterio(
      id: 58,
      criterio:
          "El programa de estudios usa herramientas de vigilancia tecnológica que le ayuden a tomar decisiones y anticiparse a los cambios de su especialidad para orientar la I+D+i.",
      idstandard: 22,
    ));
    lstCriterio.add(Criterio(
      id: 59,
      criterio:
          "El programa de estudios mantiene y ejecuta mecanismos para promover la I+D+i en las líneas establecidas y evalúa el logro (por ejemplo, patentes, publicaciones, desarrollos tecnológicos, presentaciones en congresos, entre otros), según lo establecido por la universidad.",
      idstandard: 22,
    ));

    //Estandar 23
    lstCriterio.add(Criterio(
      id: 60,
      criterio:
          "La rigurosidad, pertinencia y calidad se establecen en lineamientos con la participación de docentes investigadores, expertos externos y en función de estándares nacionales e internacionales. Estos lineamientos deben haber sido elaborados por investigadores registrados en el Regina y estar alineados con la política general de I+D+i de la universidad.",
      idstandard: 23,
    ));
    lstCriterio.add(Criterio(
      id: 61,
      criterio:
          "Todas las investigaciones conducentes al grado o título deben guardar coherencia con las líneas de investigación registrados por el programa de estudios.",
      idstandard: 23,
    ));
    lstCriterio.add(Criterio(
      id: 62,
      criterio:
          "El programa ejecuta mecanismos para garantizar el cumplimiento de los lineamientos de I+D+i.",
      idstandard: 23,
    ));

    //Estandar 24
    lstCriterio.add(Criterio(
      id: 63,
      criterio:
          "El programa de estudios brinda facilidades para que los resultados de los trabajos de I+D+i se puedan publicar en artículos científicos, libros o capítulos de libros o registros de propiedad intelectual. ",
      idstandard: 24,
    ));
    lstCriterio.add(Criterio(
      id: 64,
      criterio:
          "El programa debe contar con artículos científicos publicados en revistas indizadas.",
      idstandard: 24,
    ));
    lstCriterio.add(Criterio(
      id: 65,
      criterio:
          "El programa de estudios establece y difunde información actualizada de las publicaciones realizadas por sus docentes y estudiantes. Además, mantiene actualizado su repositorio de investigaciones, de fácil acceso al público en general.",
      idstandard: 24,
    ));
    lstCriterio.add(Criterio(
      id: 66,
      criterio:
          "Los sílabos de cursos incluyen resultados de las investigaciones.",
      idstandard: 24,
    ));
    lstCriterio.add(Criterio(
      id: 67,
      criterio:
          "Los docentes son capacitados para ayudarlos a lograr las publicaciones.",
      idstandard: 24,
    ));

    //Estandar 25
    lstCriterio.add(Criterio(
      id: 68,
      criterio:
          "Las acciones de responsabilidad social relevantes a la formación de los estudiantes deben guardar relación con la especialidad.",
      idstandard: 25,
    ));
    lstCriterio.add(Criterio(
      id: 69,
      criterio:
          "Las acciones de responsabilidad social deben considerar los principios de equidad e inclusión en su entorno. Asimismo, considerar la articulación con entidades internas y externas a la universidad, a fin de facilitar y obtener mayor impacto en el ámbito social.",
      idstandard: 25,
    ));

    //Estanar 26
    lstCriterio.add(Criterio(
      id: 70,
      criterio:
          "El programa de estudios conoce e implementa los estándares establecidos sobre seguridad ambiental dispuestos por los órganos competentes (Minam, Minedu u otros).",
      idstandard: 26,
    ));

    //Estandar 27
    lstCriterio.add(Criterio(
      id: 71,
      criterio:
          "El programa de estudios tiene servicios de bienestar, mantiene y ejecuta mecanismos para asegurar que los estudiantes, docentes y personal administrativo conocen dichos programas de bienestar y acceden a ellos.",
      idstandard: 27,
    ));
    lstCriterio.add(Criterio(
      id: 72,
      criterio:
          "El programa de estudios implementa mecanismos para evaluar el nivel de satisfacción de los usuarios de los servicios de bienestar.",
      idstandard: 27,
    ));

    //Estandar 28
    lstCriterio.add(Criterio(
      id: 73,
      criterio:
          "El programa de estudios identifica las necesidades de equipamiento para lograr las competencias planteadas en el perfill de egreso.",
      idstandard: 28,
    ));
    lstCriterio.add(Criterio(
      id: 74,
      criterio:
          "El programa de estudios diferencia entre laboratorios de investigación y de enseñanza, dependiendo de la disciplina.",
      idstandard: 28,
    ));
    lstCriterio.add(Criterio(
      id: 75,
      criterio:
          "Si el programa de estudios contempla un porcentaje de virtualización, deberá contarse con la infraestructura y equipamientos que ayuden a su correcta ejecución.",
      idstandard: 28,
    ));

    //Estandar 29
    lstCriterio.add(Criterio(
      id: 76,
      criterio:
          "El programa de estudios demuestra que hace uso del programa de desarrollo, ampliación, mantenimiento, renovación y seguridad de su infraestructura y equipamiento",
      idstandard: 29,
    ));
    lstCriterio.add(Criterio(
      id: 77,
      criterio:
          "El equipamiento está en condiciones adecuadas para su uso y cuenta con el soporte para su mantenimiento y funcionamiento.",
      idstandard: 29,
    ));
    //Estandar 30
    lstCriterio.add(Criterio(
      id: 78,
      criterio:
          "El programa de estudios diseña e implementa el sistema de información y comunicación, determina los procedimientos y registros, así como evalúa su funcionamiento.",
      idstandard: 30,
    ));
    lstCriterio.add(Criterio(
      id: 79,
      criterio:
          "El programa de estudios garantiza que el sistema de información incorpore tanto información técnica como estadística, así como el uso del mismo en la gestión académica, I+D+i y administrativa.",
      idstandard: 30,
    ));
    //Estandar 31
    lstCriterio.add(Criterio(
      id: 80,
      criterio:
          "El centro de información y referencia o similar puede incluir: biblioteca tradicional, biblioteca virtual, acceso a bases de datos, hemerotecas, entre otros. Además, deberá incluir el repositorio de tesis e investigaciones realizadas en el programa de estudios. Dicho repositorio deberá considerar lo indicado en la Ley de Repositorio Nacional.",
      idstandard: 31,
    ));
    lstCriterio.add(Criterio(
      id: 81,
      criterio:
          "El programa de estudios tiene un programa que anualmente asegura la actualización y mejora del centro de información y referencia o similar, en concordancia con las necesidades del programa de estudios o vigilancia tecnológica.",
      idstandard: 31,
    ));
    lstCriterio.add(Criterio(
      id: 82,
      criterio:
          "El centro de información y referencia se encuentra diseñado para satisfacer las necesidades de los docentes y estudiantes, en términos de libros más solicitados, bases de datos, adquisición y manejo de los libros de acuerdo con la necesidad del programa de estudios, etc. Es capaz de reportar indicadores de satisfacción y de uso de los principales servicios que se brinden.",
      idstandard: 31,
    ));
    //Estandar 32
    lstCriterio.add(Criterio(
      id: 83,
      criterio:
          "El programa de estudios gestiona los recursos humanos de acuerdo con los perfiles de puestos y funciones establecidas.",
      idstandard: 32,
    ));
    lstCriterio.add(Criterio(
      id: 84,
      criterio:
          "El programa de estudios identifica los logros y las necesidades de capacitación a partir de la evaluación de personal.",
      idstandard: 32,
    ));
    lstCriterio.add(Criterio(
      id: 85,
      criterio:
          "El programa de estudios dispone de un registro en el cual se considera: nombre del personal administrativo/directivo, cargo, grado académico, título profesional, experiencia profesional, experiencia en gestión, horas de capacitación en los últimos tres años en temas afines al cargo, entre otros.",
      idstandard: 32,
    ));
    //Estandar 33
    lstCriterio.add(Criterio(
      id: 86,
      criterio:
          "El avance en el logro de las competencias se evalúa de forma directa a lo largo de la formación de los estudiantes.",
      idstandard: 33,
    ));
    lstCriterio.add(Criterio(
      id: 87,
      criterio:
          "El programa de estudios define y aplica mecanismos de evaluación del logro de competencias definidas en el perfil de egreso",
      idstandard: 33,
    ));

    //Estandar 34
    lstCriterio.add(Criterio(
      id: 88,
      criterio:
          "El monitoreo de la inserción laboral debe considerar y mostrar información cuantitativa y cualitativa relacionada con la empleabilidad del país",
      idstandard: 34,
    ));
    lstCriterio.add(Criterio(
      id: 89,
      criterio:
          "El logro de los objetivos educacionales implica una evaluación indirecta del desempeño profesional esperado, que está alineado con el perfil de egreso. Esta medición puede incluir la satisfacción de empleadores y egresados, la certificación de competencias, entre otros.",
      idstandard: 34,
    ));
    lstCriterio.add(Criterio(
      id: 90,
      criterio:
          "Los hallazgos del seguimiento a egresados orientan al programa de estudios para realizar la revisión y actualización del perfil de egreso, así como de los objetivos educacionales.",
      idstandard: 34,
    ));
  }

  String AddTitleNav(int factor) {
    String titleNav = "";
    if (factor == 1) {
      titleNav = "Syllabus planning";
    } else if (factor == 2) {
      titleNav = "Management of the graduate profile";
    } else if (factor == 3) {
      titleNav = "Quality assurance";
    } else if (factor == 4) {
      titleNav = "Teaching-learning process";
    } else if (factor == 5) {
      titleNav = "Teacher management";
    } else if (factor == 6) {
      titleNav = "Student follow-up";
    } else if (factor == 7) {
      titleNav = "Research and innovation";
    } else if (factor == 8) {
      titleNav = "University social responsibility";
    } else if (factor == 9) {
      titleNav = "Wellness services";
    } else if (factor == 10) {
      titleNav = "Infrastructure and support";
    } else if (factor == 11) {
      titleNav = "Human Resources";
    } else if (factor == 12) {
      titleNav = "Verification of the graduate profile";
    }
    return titleNav;
  }

  String AddTitleBody(int factor) {
    String titleBody = "";
    if (factor > 0 && factor <= 3) {
      titleBody = "GESTIÓN ESTRATÉGICA";
    } else if (factor > 3 && factor <= 8) {
      titleBody = "FORMACIÓN INTEGRAL";
    } else if (factor > 8 && factor <= 11) {
      titleBody = "SOPORTE INSTITUCIONAL";
    } else if (factor > 11) {
      titleBody = "RESULTADOS";
    }
    return titleBody;
  }
}

class _FormQuestionnaire extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final List<Factor> lstFactor;
  final List<Standard> lstStandard;
  final List<Criterio> lstCriterio;
  final Factor? selectedFactor;
  final Standard? selectedStandard;
  final ValueChanged<Factor?>? onFactorChanged;
  final ValueChanged<Standard?>? onStandardChange;
  final void Function(Criterio, bool) onCriterioChanged;
  final int factor;

  _FormQuestionnaire({
    required this.lstFactor,
    required this.lstStandard,
    required this.lstCriterio,
    this.selectedFactor,
    this.selectedStandard,
    this.onFactorChanged,
    this.onStandardChange,
    required this.onCriterioChanged,
    required this.factor,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonFormField<int>(
            value: selectedFactor?.id,
            validator: (int? value) {
              if (value == null || value == 0) {
                return "Seleccione una opción";
              }
            },
            items: lstFactor.map((Factor factor) {
              return DropdownMenuItem<int>(
                value: factor.id,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.70,
                  child: Text(
                    '${factor.factor} - ${factor.name}',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ),
              );
            }).toList(),
            onChanged: (int? value) {
              if (value != null) {
                Factor? selectedFactor =
                    lstFactor.firstWhere((factor) => factor.id == value);
                if (selectedFactor != null) {
                  onFactorChanged?.call(selectedFactor);
                }
              }
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Factores (*)",
            ),
          ),
          SizedBox(height: 20),
          DropdownButtonFormField<int>(
            value: selectedStandard?.id,
            validator: (int? value) {
              if (value == null || value == 0) {
                return "Seleccione una opción";
              }
            },
            items: lstStandard
                .where((standard) => standard.idfactor == selectedFactor?.id)
                .map((Standard standar) {
              return DropdownMenuItem(
                value: standar.id,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    '${standar.standard} - ${standar.name}',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ),
              );
            }).toList(),
            onChanged: (int? value) {
              if (value != null) {
                Standard? selectedStandard =
                    lstStandard.firstWhere((standard) => standard.id == value);
                if (selectedStandard != null) {
                  onStandardChange?.call(selectedStandard);
                }
              }
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Estandares (*)",
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Campos obligatorios (*)",
            style: TextStyle(color: Colors.red),
          ),
          SizedBox(height: 20),
          if (selectedStandard != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  height: 1, // Altura del separador
                  color: Colors.grey, // Color del separador
                ),
                SizedBox(height: 10),
                Text(
                  "Criterios de evaluación",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "IMPORTANTE: Debe seleccionar los criterios que usted crea conveniente.",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey[800]),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: lstCriterio
                      .where((criterio) =>
                          criterio.idstandard == selectedStandard?.id)
                      .map((criterio) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: CheckboxListTile(
                        title: Text(
                          criterio.criterio,
                          textAlign: TextAlign.justify,
                        ),
                        value: criterio.ischecked,
                        onChanged: (bool? value) {
                          onCriterioChanged(criterio, value ?? false);
                        },
                        controlAffinity: ListTileControlAffinity.platform,
                        activeColor: Colors.indigo,
                        checkColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 5,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          SizedBox(height: 20),
          Center(
            child: MaterialButton(
              child: Padding(
                padding: EdgeInsets.all(18),
                child: Text(
                  "Enviar",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              color: Colors.indigo,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              onPressed: () {
                List<Criterio> CriteriosByStandar = lstCriterio
                    .where((criterio) =>
                        criterio.idstandard == selectedStandard?.id)
                    .toList();
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResponseScreem(
                              lstCriterio: CriteriosByStandar,
                              factor: factor,
                            )),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
