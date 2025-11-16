#!/bin/bash
# ============================================================================
# Тестовый скрипт для проверки корректности сортировки
# ============================================================================

set -e

echo "╔════════════════════════════════════════╗"
echo "║   Testing Batcher Sort Implementation  ║"
echo "╚════════════════════════════════════════╝"
echo

# Тест 1: Обратный порядок
echo "Test 1: Reverse order (9..1)"
./batcher_sort 2 9 8 7 6 5 4 3 2 1 > result1.txt 2>&1
if grep -q "Sorted array:  1 2 3 4 5 6 7 8 9" result1.txt && \
   grep -q "✓ Array is correctly sorted!" result1.txt; then
    echo "✓ Test 1 passed"
else
    echo "✗ Test 1 FAILED"
    cat result1.txt
    exit 1
fi

# Тест 2: Уже отсортированный
echo "Test 2: Already sorted (1..9)"
./batcher_sort 2 1 2 3 4 5 6 7 8 9 > result2.txt 2>&1
if grep -q "Sorted array:  1 2 3 4 5 6 7 8 9" result2.txt && \
   grep -q "✓ Array is correctly sorted!" result2.txt; then
    echo "✓ Test 2 passed"
else
    echo "✗ Test 2 FAILED"
    exit 1
fi

# Тест 3: Больше потоков
echo "Test 3: More threads (10..1)"
./batcher_sort 10 10 9 8 7 6 5 4 3 2 1 > result3.txt 2>&1
if grep -q "Sorted array:  1 2 3 4 5 6 7 8 9 10" result3.txt && \
   grep -q "✓ Array is correctly sorted!" result3.txt; then
    echo "✓ Test 3 passed"
else
    echo "✗ Test 3 FAILED"
    exit 1
fi

# Тест 4: Случайный порядок
echo "Test 4: Random order"
./batcher_sort 5 5 2 9 1 7 3 8 4 6 > result4.txt 2>&1
if grep -q "Sorted array:  1 2 3 4 5 6 7 8 9" result4.txt && \
   grep -q "✓ Array is correctly sorted!" result4.txt; then
    echo "✓ Test 4 passed"
else
    echo "✗ Test 4 FAILED"
    exit 1
fi

# Тест 5: Минимальный массив
echo "Test 5: Two elements"
./batcher_sort 2 2 1 > result5.txt 2>&1
if grep -q "Sorted array:  1 2" result5.txt && \
   grep -q "✓ Array is correctly sorted!" result5.txt; then
    echo "✓ Test 5 passed"
else
    echo "✗ Test 5 FAILED"
    exit 1
fi

# Тест 6: Один поток
echo "Test 6: Single thread"
./batcher_sort 1 5 4 3 2 1 > result6.txt 2>&1
if grep -q "Sorted array:  1 2 3 4 5" result6.txt && \
   grep -q "✓ Array is correctly sorted!" result6.txt; then
    echo "✓ Test 6 passed"
else
    echo "✗ Test 6 FAILED"
    exit 1
fi

# Тест 7: Повторяющиеся элементы
echo "Test 7: Duplicates"
./batcher_sort 4 3 1 2 1 3 2 > result7.txt 2>&1
if grep -q "Sorted array:  1 1 2 2 3 3" result7.txt && \
   grep -q "✓ Array is correctly sorted!" result7.txt; then
    echo "✓ Test 7 passed"
else
    echo "✗ Test 7 FAILED"
    exit 1
fi

echo
echo "╔════════════════════════════════════════╗"
echo "║   All 7 tests passed successfully! ✓   ║"
echo "╚════════════════════════════════════════╝"