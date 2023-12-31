import 'package:casper/models/models.dart';

final evaluationCriteriasGLOBAL = [
  EvaluationCriteria(
    id: '1',
    course: 'CP302',
    semester: '1',
    year: '2023',
    numberOfWeeks: 14,
    weeksToConsider: 10,
    regular: 20,
    midtermSupervisor: 10,
    midtermPanel: 20,
    endtermSupervisor: 10,
    endtermPanel: 30,
    report: 10,
  ),
];

final studentsGLOBAL = [
  Student(
    id: '2020csb1187',
    name: 'Ojassvi Kumar',
    entryNumber: '2020csb1187',
    email: '2020csb1187@iitrpr.ac.in',
  ),
  Student(
    id: '2020csb1153',
    name: 'Aman Kumar',
    entryNumber: '2020csb1153',
    email: '2020csb1153@iitrpr.ac.in',
  ),
  Student(
    id: '2020csb1198',
    name: 'Rishabh Jain',
    entryNumber: '2020csb1198',
    email: '2020csb1198@iitrpr.ac.in',
  ),
  Student(
    id: '2020csb1154',
    name: 'Aman Pankaj Adatia',
    entryNumber: '2020csb1154',
    email: '2020csb1154@iitrpr.ac.in',
  ),
];

final facultyGLOBAL = [
  Faculty(
    id: '1',
    name: 'Dr Shweta Jain',
    email: 'sj@iitrpr.ac.in',
  ),
  Faculty(
    id: '2',
    name: 'Dr Shashi Shekhar Jha',
    email: 'ssj@iitrpr.ac.in',
  ),
  Faculty(
    id: '3',
    name: 'Dr Apurva Mudgal',
    email: 'am@iitrpr.ac.in',
  ),
  Faculty(
    id: '4',
    name: 'Dr Anil Shukla',
    email: 'as@iitrpr.ac.in',
  ),
  Faculty(
    id: '5',
    name: 'Dr Nitin Auluck',
    email: 'na@iitrpr.ac.in',
  ),
  Faculty(
    id: '6',
    name: 'Dr Vishwanath Gunturi',
    email: 'vg@iitrpr.ac.in',
  ),
];

final teamsGLOBAL = [
  Team(
    id: '1',
    numberOfMembers: 2,
    students: [
      studentsGLOBAL[0],
      studentsGLOBAL[1],
    ],
  ),
  Team(
    id: '2',
    numberOfMembers: 2,
    students: [
      studentsGLOBAL[2],
      studentsGLOBAL[3],
    ],
  ),
];

final panelGLOBAL = [
  Panel(
    id: '4',
    course: 'CP302',
    semester: '2',
    year: '2023',
    numberOfEvaluators: 2,
    evaluators: [
      facultyGLOBAL[0],
      facultyGLOBAL[1],
    ],
  ),
  Panel(
    id: '2',
    course: 'CP302',
    semester: '2',
    year: '2023',
    numberOfEvaluators: 2,
    evaluators: [
      facultyGLOBAL[2],
      facultyGLOBAL[3],
    ],
  ),
  Panel(
    id: '3',
    course: 'CP302',
    semester: '2',
    year: '2023',
    numberOfEvaluators: 2,
    evaluators: [
      facultyGLOBAL[4],
      facultyGLOBAL[5],
    ],
  ),
];

final evaluationsGLOBAL = [
  Evaluation(
    id: '1',
    marks: 17,
    remarks: 'Good work',
    type: 'midterm-panel',
    student: studentsGLOBAL[0],
    faculty: facultyGLOBAL[0],
  ),
  Evaluation(
    id: '2',
    marks: 15.5,
    remarks: 'Average work',
    type: 'midterm-panel',
    student: studentsGLOBAL[1],
    faculty: facultyGLOBAL[0],
  ),
  Evaluation(
    id: '3',
    marks: 15,
    remarks: 'Good work',
    type: 'midterm-panel',
    student: studentsGLOBAL[0],
    faculty: facultyGLOBAL[1],
  ),
  Evaluation(
    id: '4',
    marks: 14,
    remarks: 'Average work',
    type: 'midterm-panel',
    student: studentsGLOBAL[1],
    faculty: facultyGLOBAL[1],
  ),
  Evaluation(
    id: '5',
    marks: 5,
    remarks: 'Good work',
    type: 'midterm-panel',
    student: studentsGLOBAL[2],
    faculty: facultyGLOBAL[2],
  ),
  Evaluation(
    id: '6',
    marks: 4,
    remarks: 'Average work',
    type: 'midterm-panel',
    student: studentsGLOBAL[3],
    faculty: facultyGLOBAL[2],
  ),
  Evaluation(
    id: '7',
    marks: 18,
    remarks: 'Good work',
    type: 'week-1',
    student: studentsGLOBAL[0],
    faculty: facultyGLOBAL[0],
  ),
  Evaluation(
    id: '8',
    marks: 16.5,
    remarks: 'Excellent work',
    type: 'week-2',
    student: studentsGLOBAL[0],
    faculty: facultyGLOBAL[0],
  ),
  Evaluation(
    id: '9',
    marks: 9.5,
    remarks: 'Excellent work',
    type: 'midterm-supervisor',
    student: studentsGLOBAL[0],
    faculty: facultyGLOBAL[0],
  ),
];

final assignedPanelsGLOBAL = [
  AssignedPanel(
    id: '1',
    course: 'CP302',
    term: 'MidTerm',
    semester: '2',
    year: '2023',
    panel: panelGLOBAL[0],
    numberOfAssignedTeams: 2,
    assignedTeams: [
      teamsGLOBAL[0],
      teamsGLOBAL[1],
    ],
    evaluations: [
      evaluationsGLOBAL[0],
      evaluationsGLOBAL[1],
      evaluationsGLOBAL[2],
      evaluationsGLOBAL[3],
    ],
  ),
  AssignedPanel(
    id: '2',
    course: 'CP302',
    term: 'MidTerm',
    semester: '2',
    year: '2023',
    panel: panelGLOBAL[1],
    numberOfAssignedTeams: 1,
    assignedTeams: [
      teamsGLOBAL[1],
    ],
    evaluations: [
      evaluationsGLOBAL[4],
      evaluationsGLOBAL[5],
    ],
  ),
  AssignedPanel(
    id: '3',
    course: 'CP302',
    term: 'MidTerm',
    semester: '2',
    year: '2023',
    panel: panelGLOBAL[2],
    numberOfAssignedTeams: 0,
    assignedTeams: [],
    evaluations: [],
  ),
];

final projectsGLOBAL = [
  Project(
    id: '1',
    title: 'Fair Clustering Algorithms',
    description: 'Project description about fair clustering algorithms',
  ),
  Project(
    id: '2',
    title: 'Blockchain',
    description: 'Project description about blockchain',
  ),
];

final offeringsGLOBAL = [
  Offering(
    id: '1',
    course: 'CP302',
    semester: '2',
    year: '2023',
    instructor: facultyGLOBAL[0],
    project: projectsGLOBAL[0],
  ),
  Offering(
    id: '2',
    course: 'CP302',
    semester: '2',
    year: '2023',
    instructor: facultyGLOBAL[1],
    project: projectsGLOBAL[1],
  ),
];

final enrollmentsGLOBAL = [
  Enrollment(
    id: '1',
    offering: offeringsGLOBAL[0],
    team: teamsGLOBAL[0],
    supervisorEvaluations: [
      evaluationsGLOBAL[6],
      evaluationsGLOBAL[7],
      evaluationsGLOBAL[8],
    ],
  ),
  Enrollment(
    id: '2',
    offering: offeringsGLOBAL[1],
    team: teamsGLOBAL[1],
    supervisorEvaluations: [
      evaluationsGLOBAL[6],
      evaluationsGLOBAL[7],
    ],
  ),
];

final releasedEventsGLOBAL = [
  ReleasedEvents(
    id: '1',
    course: 'CP302',
    semester: '2',
    year: '2023',
    events: [
      Event(
        id: '1',
        type: 'week-1',
        start: '01/04',
        end: '08/04',
      ),
      Event(
        id: '2',
        type: 'week-2',
        start: '08/04',
        end: '15/04',
      ),
      Event(
        id: '4',
        type: 'week-3',
        start: '22/04',
        end: '29/04',
      ),
      Event(
        id: '3',
        type: 'midterm',
        start: '15/04',
        end: '22/04',
      ),
    ],
  ),
];
