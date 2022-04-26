const std = @import("std");

pub fn globMatch(pattern: []const u8, string: []const u8) bool {
    _ = pattern;
    _ = string;
    var patternIdx: usize = 0;
    var stringIdx: usize = 0;

    return false;
}

fn newTC(string: []const u8, match: bool) TestCases.TestCase {
    return .{
        .string = string,
        .match = match,
    };
}

const TestCases = struct {
    pub const TestCase = struct {
        string: []const u8,
        match: bool,
    };
    pattern: []const u8,
    tests: []const TestCase,
};

test {
    const tcs = [_]TestCases{
        .{
            .pattern = "*.d",
            .tests = &.{
                newTC("thing.d", true),
                newTC("thing.c", false),
            },
        },
    };
    for (tcs) |tc| {
        for (tc.tests) |test_case| {
            try std.testing.expectEqual(test_case.match, globMatch(tc.pattern, test_case.string));
        }
    }
}
