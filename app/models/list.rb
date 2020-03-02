class List < ApplicationRecord
  has_many :tasks

    def complete_all_tasks!
      tasks.update_all(complete: true)
    end

    def snooze_all_tasks!
      # tasks.each { |task| task.snooze_hour! }
      tasks.each(&:snooze_hour!)
    end

    def total_duration
      tasks.sum(:duration)
      # total = 0
      # tasks.each do |task|
      #   total += task.duration
      # end
      # return total
    end

    def incomplete_tasks
      # array_of_tasks = []
      # tasks.each do |task|
      #   if !task.complete
      #     array_of_tasks << task
      #   end
      # end
      # return array_of_tasks


      # tasks.select {|task| !task.complete }


      tasks.where(complete: false)

    end

    def favorite_tasks
      # array_of_tasks = []
      # tasks.each do |task|
      #   if task.favorite
      #     array_of_tasks << task
      #   end
      # end
      # return array_of_tasks

      task.where(favorite: true)
    end

end
