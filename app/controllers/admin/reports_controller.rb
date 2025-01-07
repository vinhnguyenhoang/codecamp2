class  Admin::ReportsController < ApplicationController
  def index
    # Example
    @exam = Exam.find(1)
    user_exams = @exam.user_exams
    categorized_scores = {
      good: 0,
      average: 0,
      below_average: 0
    }

    user_exams.each do |user_exam|
      if user_exam.score >= 8
        categorized_scores[:good] += 1
      elsif user_exam.score >= 5
        categorized_scores[:average] += 1
      else
        categorized_scores[:below_average] += 1
      end
    end

    @chart_data = {
      labels: ['Good', 'Average', 'Below Average'],
      datasets: [{
        label: 'Scores Distribution',
        data: [categorized_scores[:good], categorized_scores[:average], categorized_scores[:below_average]],
        backgroundColor: ['#4CAF50', '#FFEB3B', '#F44336'], # Green, Yellow, Red for good, average, below average
        hoverBackgroundColor: ['#388E3C', '#FBC02D', '#D32F2F']
      }]
    }
  end

  def show
    @exam = Exam.find(params[:id])
    user_exams = @exam.user_exams
    categorized_scores = {
      good: 0,
      average: 0,
      below_average: 0
    }

    user_exams.each do |user_exam|
      if user_exam.score >= 8
        categorized_scores[:good] += 1
      elsif user_exam.score >= 5
        categorized_scores[:average] += 1
      else
        categorized_scores[:below_average] += 1
      end
    end

    @chart_data = {
      labels: ['Good', 'Average', 'Below Average'],
      datasets: [{
        label: 'Scores Distribution',
        data: [categorized_scores[:good], categorized_scores[:average], categorized_scores[:below_average]],
        backgroundColor: ['#4CAF50', '#FFEB3B', '#F44336'], # Green, Yellow, Red for good, average, below average
        hoverBackgroundColor: ['#388E3C', '#FBC02D', '#D32F2F']
      }]
    }
  end
end
