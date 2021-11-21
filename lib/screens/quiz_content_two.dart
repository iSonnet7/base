import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:base/services/base_user_service.dart';
import 'package:base/widgets/title_widget.dart';
import 'package:base/widgets/title_icon_widget.dart';
import 'package:base/widgets/question_answer_widget.dart';
import 'package:base/models/question_model_two.dart';
import 'package:base/screens/results.dart';

class QuizContentTwo extends StatefulWidget {
  final String quizId;
  final String quizTitle;
  final int noQuiz;

  QuizContentTwo(this.quizId, this.quizTitle, this.noQuiz);

  @override
  _QuizContentState createState() => _QuizContentState();
}

int _score = 0;
int _questionsCompleted = 0;
List<int> _answersValue = [0, 0, 0, 0, 0];

class _QuizContentState extends State<QuizContentTwo> {
  late QuerySnapshot questionsSnapshot;
  UserService databaseService = new UserService();

  bool isLoading = true;

  QuestionModelTwo getQuestionModelFromDataSnapshot(
      DocumentSnapshot questionSnapshot) {
    QuestionModelTwo questionModel = new QuestionModelTwo();
    questionModel.question = questionSnapshot.get('question');

    List<String> options;

    options = [
      'Nunca',
      'Rara vez',
      'Algunas veces',
      'Bastantes veces',
      'Casi siempre'
    ];
    _answersValue = [0, 1, 2, 3, 4];

    questionModel.option1 = options[0];
    questionModel.option2 = options[1];
    questionModel.option3 = options[2];
    questionModel.option4 = options[3];
    questionModel.option5 = options[4];
    questionModel.answered = false;

    return questionModel;
  }

  @override
  void initState() {
    //Se pasa el Id del quiz
    databaseService.getQuizData(widget.quizId).then((value) {
      questionsSnapshot = value;

      _score = 0;
      _questionsCompleted = 0;
      _answersValue = [0, 0, 0, 0, 0];
      isLoading = false;

      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: AppLogo(quizTitle: widget.quizTitle),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.black.withOpacity(0.7)),
            brightness: Brightness.light,
            leading: TitleIcon()),
        body: isLoading
            ? Container(
                child: Center(child: CircularProgressIndicator()),
                margin: const EdgeInsets.all(50.0),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    questionsSnapshot == null ||
                            questionsSnapshot.docs.length == 0
                        ? Container(
                            child: Center(child: Text('No hay datos')),
                            margin: const EdgeInsets.all(50.0),
                          )
                        : Container(
                            child: Column(
                              children: [
                                ListView.builder(
                                    //padding: EdgeInsets.symmetric(horizontal: 5),
                                    shrinkWrap: true,
                                    physics: ClampingScrollPhysics(),
                                    itemCount: questionsSnapshot.docs.length,
                                    itemBuilder: (context, index) {
                                      return QuizContentTile(
                                        questionModel:
                                            getQuestionModelFromDataSnapshot(
                                                questionsSnapshot.docs[index]),
                                        index: index,
                                      );
                                    }),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Results(
                                                  score: _score,
                                                  noQuiz: widget.noQuiz,
                                                )));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 24, vertical: 12),
                                    decoration: BoxDecoration(
                                        //color: Color.fromRGBO(255, 191, 134, 1),
                                        color: Colors.red.withOpacity(0.8),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    margin: const EdgeInsets.only(bottom: 18),
                                    child: Text(
                                      "Finalizar",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 19),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              ));
  }
}

class QuizContentTile extends StatefulWidget {
  final QuestionModelTwo questionModel;
  final int index;

  QuizContentTile({required this.questionModel, required this.index});

  @override
  _QuizContentTileState createState() => _QuizContentTileState();
}

class _QuizContentTileState extends State<QuizContentTile> {
  String optionSelected = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        //Coloca la pregunta al inicio horizontalmente
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              //Coloca la pregunta
              "${widget.index + 1}" + ". " + "${widget.questionModel.question}",
              style:
                  TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.8)),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered) {
                setState(() {
                  optionSelected = widget.questionModel.option1; //Marca la opc.
                  widget.questionModel.answered = true;
                  _score += _answersValue[0]; //Puntaje
                  _questionsCompleted += 1;
                });
              }
            },
            child: OptionTile(
              option: "a",
              description: "${widget.questionModel.option1}",
              optionSelected: optionSelected,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered) {
                setState(() {
                  optionSelected = widget.questionModel.option2;
                  widget.questionModel.answered = true;
                  _score += _answersValue[1];
                  _questionsCompleted += 1;
                });
              }
            },
            child: OptionTile(
              option: "b",
              description: "${widget.questionModel.option2}",
              optionSelected: optionSelected,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered) {
                setState(() {
                  optionSelected = widget.questionModel.option3;
                  widget.questionModel.answered = true;
                  _score += _answersValue[2];
                  _questionsCompleted += 1;
                });
              }
            },
            child: OptionTile(
              option: "c",
              description: "${widget.questionModel.option3}",
              optionSelected: optionSelected,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered) {
                setState(() {
                  optionSelected = widget.questionModel.option4;
                  widget.questionModel.answered = true;
                  _score += _answersValue[3];
                  _questionsCompleted += 1;
                });
              }
            },
            child: OptionTile(
              option: "d",
              description: "${widget.questionModel.option4}",
              optionSelected: optionSelected,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered) {
                setState(() {
                  optionSelected = widget.questionModel.option5;
                  widget.questionModel.answered = true;
                  _score += _answersValue[4];
                  _questionsCompleted += 1;
                });
              }
            },
            child: OptionTile(
              option: "e",
              description: "${widget.questionModel.option5}",
              optionSelected: optionSelected,
            ),
          ),
        ],
      ),
    );
  }
}
