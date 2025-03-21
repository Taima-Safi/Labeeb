﻿using Labeeb.Dto.Shared;

namespace Labeeb.Dto.Dto;

public class QuestionFormDto
{
    public string Title { get; set; }
    public bool? IsTrue { get; set; } // if true false question
    public QuestionLevel Level { get; set; }

    public long LessonId { get; set; }
    public List<ChoiceFormDto> Choices { get; set; } = [];
}
