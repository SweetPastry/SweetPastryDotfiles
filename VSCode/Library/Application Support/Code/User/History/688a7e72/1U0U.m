data = [randn(2, 5), randn(2, 3) + ones(2, 3) * 10]
plot(data(1, :), data(2, :), 'bo')

class1 = []
class2 = []

euclide_dis = []

for i = 1:8
    disi = []
    for j = i+1:8
        disij = sqrt(sum((data(i,:)-data(j,:)).^2))
        disi = [disi disij]
    end
    euclide_dis = [euclide_dis disi]
end

if 