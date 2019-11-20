def solution(area)
  smallest_perm = nil
  upper_bound = Math.sqrt(area).floor

  (1..upper_bound).each do |num|
    next unless (area % num).zero?

    current_perm = 2 * (num + (area/num))
    smallest_perm ||= current_perm
    smallest_perm = [smallest_perm, current_perm].min
  end

  smallest_perm
end
