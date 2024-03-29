part of 'cast_bloc.dart';

enum ChastPageStatus { initial, loading, success, failure }

class CastState extends Equatable {
  const CastState({
    this.status = ChastPageStatus.initial,
    this.characters = const [],
    this.hasReachedEnd = false,
    this.currentPage = 1,
  });

  final ChastPageStatus status;
  final List<Character> characters;
  final bool hasReachedEnd;
  final int currentPage;

  CastState copyWith({
    ChastPageStatus? status,
    List<Character>? characters,
    bool? hasReachedEnd,
    int? currentPage,
  }) {
    return CastState(
      status: status ?? this.status,
      characters: characters ?? this.characters,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object> get props => [
        status,
        characters,
        hasReachedEnd,
        currentPage,
      ];
}
