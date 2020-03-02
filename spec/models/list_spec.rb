require 'rails_helper'

RSpec.describe List, type: :model do
  describe '#complete_all_tasks!' do
    it 'should mark all tasks from the list as complete' do
      list = List.create(name: "Shopping List")
      Task.create(complete: false, list_id: list.id)
      Task.create(complete: false, list_id: list.id)

      list.complete_all_tasks!

      list.tasks.each do |task|
      expect(task.complete).to eq(true)   
      end      
    end
  end

  describe '#snooze_all_tasks!' do
    it 'should snooze each task on list ' do
      list = List.create(name: "Snooz lose")
      time_stamp = [ Time.now,
                    1.hour.from_now,
                    30.minutes.ago
                  ]
      time_stamps.each do |time_stamp|
        Task.create(deadline: time_stamp, list_id: list.id)
      end

      list.snooze_all_tasks!

      list.tasks.each_with_index  do |task, index|
        expect(list.deadline).to eq(time_stamp[index] + 1.hour)
      end
    end
  end

  describe '#total_duration' do
    it 'should show' do
    list = List.create(name: "Total ")
    Task.create(duration: 1, list_id: list.id)
    Task.create(duration: 2, list_id: list.id)

    list.total_duration

    expect(list.total_duration).to eq(3)
    end
  end

  describe '#incomplete_tasks' do
    it 'should return all tasks on the list that are incomplete' do
      list = List.create(name: "incomplete")
      Task.create(complete: false, list_id: list.id)
      Task.create(complete: false, list_id: list.id)

      list.incomplete_tasks

      expect(list.incomplete_tasks.length).to eq(2)
    end
  end

  describe '#favorite_tasks' do
    it 'should return' do
      list = List.create(name: "Favorite tasks")
      Task.create(favorite: true, list_id: list.id)
      Task.create(favorite: true, list_id: list.id)

      list.favorite_tasks

      expect(list.favorite_tasks.length).to eq(2)
    end
  end

end

